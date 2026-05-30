import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import mongoose from 'mongoose';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/sukh-bmw-db';

app.use(cors());
app.use(express.json());

mongoose.connect(MONGODB_URI)
  .then(() => console.log('✅ MongoDB connected'))
  .catch(err => console.error('❌ MongoDB error:', err));

app.get('/api/health', (req, res) => {
  res.json({ status: 'Server is running!', timestamp: new Date() });
});

app.get('/api/models', (req, res) => {
  const bmwModels = [
    { id: 1, name: 'BMW M3', price: 109900, year: 2024 },
    { id: 2, name: 'BMW X5', price: 84900, year: 2024 },
    { id: 3, name: 'BMW i4', price: 63900, year: 2024 },
  ];
  res.json(bmwModels);
});

app.post('/api/configure', (req, res) => {
  const { model, color, interior } = req.body;
  
  if (!model) {
    return res.status(400).json({ error: 'Model is required' });
  }

  res.json({ 
    success: true, 
    configuration: { model, color, interior, createdAt: new Date() }
  });
});

app.listen(PORT, () => {
  console.log(`🚗 BMW Server running on http://localhost:${PORT}`);
});
