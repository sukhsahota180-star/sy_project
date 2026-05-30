import { useState } from 'react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-900 to-blue-800">
      <nav className="bg-black bg-opacity-50 text-white p-4">
        <div className="max-w-6xl mx-auto flex justify-between items-center">
          <h1 className="text-3xl font-bold">🚗 BMW Web App</h1>
          <ul className="flex gap-6">
            <li><a href="#" className="hover:text-blue-300">Home</a></li>
            <li><a href="#" className="hover:text-blue-300">Models</a></li>
            <li><a href="#" className="hover:text-blue-300">Configurator</a></li>
            <li><a href="#" className="hover:text-blue-300">Contact</a></li>
          </ul>
        </div>
      </nav>

      <main className="max-w-6xl mx-auto px-4 py-20 text-white">
        <section className="text-center mb-20">
          <h2 className="text-5xl font-bold mb-4">Welcome to Sukh's BMW Web App</h2>
          <p className="text-xl text-gray-200 mb-8">Discover, configure, and explore the ultimate driving experience</p>
          <button className="bg-blue-500 hover:bg-blue-600 px-8 py-3 rounded-lg text-lg font-semibold">
            Explore Models
          </button>
        </section>

        <section className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-20">
          <div className="bg-white bg-opacity-10 p-8 rounded-lg backdrop-blur">
            <h3 className="text-2xl font-bold mb-4">🎨 Customize</h3>
            <p>Choose your favorite BMW model and customize it to your preferences</p>
          </div>
          <div className="bg-white bg-opacity-10 p-8 rounded-lg backdrop-blur">
            <h3 className="text-2xl font-bold mb-4">💰 Real Pricing</h3>
            <p>Get instant pricing quotes based on your configuration</p>
          </div>
          <div className="bg-white bg-opacity-10 p-8 rounded-lg backdrop-blur">
            <h3 className="text-2xl font-bold mb-4">📊 Inventory</h3>
            <p>Browse our latest inventory and availability</p>
          </div>
        </section>

        <section className="text-center">
          <h3 className="text-2xl font-bold mb-6">Counter: {count}</h3>
          <button 
            onClick={() => setCount(count + 1)}
            className="bg-green-500 hover:bg-green-600 px-6 py-2 rounded-lg font-semibold"
          >
            Increment
          </button>
        </section>
      </main>
    </div>
  )
}

export default App
