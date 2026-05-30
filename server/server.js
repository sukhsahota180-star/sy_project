import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import mongoose from 'mongoose';
import { errorHandler, notFound } from './middleware/errorHandler.js';
import modelsRouter from './routes/models.js';
import inventoryRouter from './routes/inventory.js';
import configurationRouter from './routes/configuration.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/sukh-bmw-db';

// Middleware
app.use(cors());
app.use(express.json());

// MongoDB Connection
try {
  await mongoose.connect(MONGODB_URI);
  console.log('✅ MongoDB connected successfully');
} catch (err) {
  console.log('⚠️ MongoDB not available, running in demo mode');
}

// Health Check
app.get('/api/health', (req, res) => {
  res.json({ status: 'Server is running!', timestamp: new Date() });
});

// Routes
app.use('/api/models', modelsRouter);
app.use('/api/inventory', inventoryRouter);
app.use('/api/configure', configurationRouter);

// Error handling
app.use(notFound);
app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`🚗 BMW Server running on http://localhost:${PORT}`);
  console.log(`📊 API available at http://localhost:${PORT}/api`);
  console.log(`🏥 Health check: http://localhost:${PORT}/api/health`);
});
