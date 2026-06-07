const express = require('express');
const cors = require('cors');
require('dotenv').config();
const admin = require('firebase-admin');

const serviceAccount = require('./serviceAccountKey.json'); // Firebase se download karein

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();
const app = express();
app.use(cors());
app.use(express.json());

// GET /words - Saare words fetch karo
app.get('/words', async (req, res) => {
  try {
    const snapshot = await db.collection('words').orderBy('createdAt', 'desc').get();
    const words = snapshot.docs.map(doc => ({
      id: doc.id,
      ...doc.data()
    }));
    res.json({ success: true, words });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
});

// POST /words - Naya word save karo
app.post('/words', async (req, res) => {
  try {
    const { word, meaning, translation } = req.body;
    if (!word || !meaning || !translation) {
      return res.status(400).json({ success: false, message: 'All fields required' });
    }
    const docRef = await db.collection('words').add({
      word, meaning, translation,
      createdAt: admin.firestore.FieldValue.serverTimestamp()
    });
    res.status(201).json({ success: true, id: docRef.id });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
});

app.listen(3000, () => console.log('Server running on port 3000'));