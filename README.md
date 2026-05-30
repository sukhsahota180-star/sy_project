# Sukh's BMW Web App 🚗

A modern, full-stack BMW car configurator and showcase application.

## Features

- 🚗 Browse BMW models
- 🎨 Customize and configure vehicles
- 💰 Real-time pricing
- 📊 Inventory management
- 📱 Responsive design
- ⚡ Fast with Vite

## Tech Stack

### Frontend
- React 18+
- Vite
- Tailwind CSS
- Axios
- React Router

### Backend
- Node.js
- Express.js
- MongoDB
- CORS enabled

## Quick Start

### Prerequisites
- Node.js 16+
- npm or yarn

### Installation

1. Clone the repository
```bash
git clone https://github.com/sukhsahota180-star/sukh-bmw-web-app.git
cd sukh-bmw-web-app
```

2. Install frontend dependencies
```bash
cd client
npm install
```

3. Install backend dependencies
```bash
cd ../server
npm install
```

### Running the App

#### Option 1: Local Development

**Terminal 1 - Frontend:**
```bash
cd client
npm run dev
```
Access at: http://localhost:5173

**Terminal 2 - Backend:**
```bash
cd server
npm run dev
```
Server runs at: http://localhost:5000

#### Option 2: Docker
```bash
docker-compose up
```
Access at: http://localhost:5000

## Project Structure

```
sukh-bmw-web-app/
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/    # Header, Footer
│   │   ├── pages/         # Home, Models, Configurator, etc.
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── index.html
│   └── package.json
├── server/                 # Express backend
│   ├── routes/            # API routes
│   ├── middleware/        # Error handling
│   ├── server.js
│   └── package.json
├── docker-compose.yml
├── Dockerfile
└── README.md
```

## API Endpoints

- `GET /api/health` - Server health check
- `GET /api/models` - Get all BMW models
- `GET /api/inventory` - Get available vehicles
- `POST /api/configure` - Create vehicle configuration

## Environment Variables

### Backend (server/.env)
```
PORT=5000
MONGODB_URI=mongodb://localhost:27017/sukh-bmw-db
JWT_SECRET=your_jwt_secret_key
NODE_ENV=development
```

### Frontend (client/.env)
```
VITE_API_URL=http://localhost:5000/api
```

## Troubleshooting

### Port Already in Use
```bash
# Kill process on port 5000
lsof -ti:5000 | xargs kill -9

# Or kill port 5173
lsof -ti:5173 | xargs kill -9
```

### MongoDB Connection Failed
- Make sure MongoDB is running
- App works in demo mode without MongoDB
- Check MONGODB_URI in .env

### CORS Errors
- Backend has CORS enabled for localhost:5173
- Check your API URL in frontend .env

### Dependencies Not Installing
```bash
rm -rf node_modules package-lock.json
npm install
```

## Pages

1. **Home** - Landing page with features
2. **Models** - Browse all BMW models
3. **Configurator** - Build your custom BMW
4. **Inventory** - View available vehicles
5. **Contact** - Send messages

## Deployment

### Vercel (Frontend)
1. Push to GitHub
2. Import repository to Vercel
3. Set build command: `npm run build`

### Heroku (Backend)
```bash
heroku create sukh-bmw-api
heroku config:set MONGODB_URI=your_uri
git push heroku main
```

## Author

Sukh (@sukhsahota180-star)

## License

MIT
