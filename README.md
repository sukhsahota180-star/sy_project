# Sukh's BMW Web App 🚗

A modern, full-stack BMW car configurator and showcase application built with React and Express.

## ✨ Features

- 🚗 Browse BMW models with real pricing
- 🎨 Customize and configure vehicles
- 💰 Real-time pricing calculator
- 📊 Vehicle inventory management
- 📱 Fully responsive design
- ⚡ Fast performance with Vite
- 🔄 Real-time API integration

## 🛠 Tech Stack

### Frontend
- React 18+
- Vite (lightning-fast build tool)
- Tailwind CSS (utility-first styling)
- React Router (client-side routing)
- Axios (HTTP client)

### Backend
- Node.js
- Express.js (REST API)
- CORS enabled
- Error handling middleware

## 🚀 Quick Start

### Prerequisites
- Node.js 16+
- npm or yarn

### Installation

**1. Clone the repository**
```bash
git clone https://github.com/sukhsahota180-star/sukh-bmw-web-app.git
cd sukh-bmw-web-app
```

**2. Install dependencies**
```bash
# Frontend
cd client
npm install

# Backend (in new terminal)
cd server
npm install
```

### Running Locally

**Terminal 1 - Start Frontend:**
```bash
cd client
npm run dev
```
📍 Access at: **http://localhost:5173**

**Terminal 2 - Start Backend:**
```bash
cd server
npm run dev
```
📍 Server runs at: **http://localhost:5000**

### Using Docker

```bash
docker-compose up
```
📍 Access at: **http://localhost:5000**

## 📁 Project Structure

```
sukh-bmw-web-app/
├── client/                          # React Frontend
│   ├── src/
│   │   ├── components/
│   │   │   ├── Header.jsx
│   │   │   └── Footer.jsx
│   │   ├── pages/
│   │   │   ├── Home.jsx
│   │   │   ├── Models.jsx
│   │   │   ├── Configurator.jsx
│   │   │   ├── Inventory.jsx
│   │   │   └── Contact.jsx
│   │   ├── App.jsx
│   │   ├── main.jsx
│   │   └── index.css
│   ├── index.html
│   ├── vite.config.js
│   └── package.json
│
├── server/                          # Express Backend
│   ├── routes/
│   │   ├── models.js
│   │   ├── inventory.js
│   │   └── configuration.js
│   ├── middleware/
│   │   └── errorHandler.js
│   ├── server.js
│   ├── .env
│   └── package.json
│
├── Dockerfile
├── docker-compose.yml
├── .gitignore
└── README.md
```

## 🔌 API Endpoints

### Health Check
```
GET /api/health
```
Response:
```json
{
  "status": "Server is running!",
  "timestamp": "2024-05-30T..."
}
```

### Models
```
GET /api/models
```
Returns all available BMW models with pricing.

### Inventory
```
GET /api/inventory
```
Returns list of available vehicles.

### Configure Vehicle
```
POST /api/configure
Body: {
  "model": "BMW M3",
  "color": "Alpine White",
  "interior": "Black Nappa Leather"
}
```

## 🌐 Environment Variables

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

## 📄 Pages

### Home
- Hero section with call-to-action buttons
- Feature highlights
- Responsive design

### Models
- Browse all BMW models
- View specifications and pricing
- Quick model selection

### Configurator
- Customize BMW with options
- Real-time price updates
- Configuration preview
- Save configurations

### Inventory
- View available vehicles
- Filter by model and year
- Detailed vehicle information

### Contact
- Contact form
- Message validation
- Success confirmation

## 🔧 Troubleshooting

### Port Already in Use

**Kill port 5000 (Backend):**
```bash
lsof -ti:5000 | xargs kill -9
```

**Kill port 5173 (Frontend):**
```bash
lsof -ti:5173 | xargs kill -9
```

### Dependencies Not Installing
```bash
rm -rf node_modules package-lock.json
npm install
```

### CORS Errors
- Ensure backend is running on port 5000
- Check API URL matches in frontend .env
- Verify CORS is enabled on backend

### API Not Responding
```bash
# Test health endpoint
curl http://localhost:5000/api/health
```

## 📦 Build for Production

**Frontend:**
```bash
cd client
npm run build
```
Output in `client/dist/`

**Docker:**
```bash
docker build -t sukh-bmw-app .
docker run -p 5000:5000 sukh-bmw-app
```

## 🚀 Deployment

### Vercel (Frontend)
1. Push to GitHub
2. Connect repository to Vercel
3. Set build command: `npm run build`
4. Deploy automatically

### Heroku (Backend)
```bash
heroku login
heroku create sukh-bmw-api
heroku config:set MONGODB_URI=your_uri
git push heroku main
```

## 📝 Available Scripts

### Frontend
```bash
npm run dev      # Start dev server
npm run build    # Build for production
npm run preview  # Preview production build
```

### Backend
```bash
npm run dev      # Start dev server with nodemon
npm start        # Start production server
```

## 🤝 Contributing

Feel free to fork and submit pull requests!

## 📄 License

MIT

## 👤 Author

Sukh (@sukhsahota180-star)

---

**Made with ❤️ by Sukh** 🚗
