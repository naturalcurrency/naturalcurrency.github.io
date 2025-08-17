import { Button } from "@/components/ui/button"
import { Link, useLocation } from "react-router-dom"
import { MetricsCarousel } from "./MetricsCarousel"
import { useAuth } from "./AuthProvider"

export function Navigation() {
  const location = useLocation()
  const { user, signOut } = useAuth()
  
  const isActive = (path: string) => location.pathname === path

  const handleSignOut = async () => {
    await signOut()
  }
  
  return (
    <div className="fixed top-0 left-0 right-0 z-50">
      <MetricsCarousel />
      <nav className="bg-black/80 backdrop-blur-md border-b border-white/10">
      <div className="max-w-7xl mx-auto px-6 lg:px-8">
        <div className="flex items-center justify-between h-20">
          {/* Logo */}
          <Link to="/" className="flex items-center">
            <div className="text-2xl font-bold bg-gradient-text bg-clip-text text-transparent">
              NATURAL CURRENCY
            </div>
          </Link>
          
          {/* Navigation Links */}
          <div className="hidden md:flex items-center space-x-2">
            <Link 
              to="/" 
              className={`px-4 py-2 rounded-full transition-all duration-300 ${
                isActive('/') 
                  ? 'bg-gradient-to-r from-accent-green to-accent-teal text-white shadow-glow' 
                  : 'text-white/70 hover:text-white hover:bg-white/10'
              }`}
            >
              Home
            </Link>
            <Link 
              to="/snapshot" 
              className={`px-4 py-2 rounded-full transition-all duration-300 ${
                isActive('/snapshot') 
                  ? 'bg-gradient-to-r from-accent-green to-accent-teal text-white shadow-glow' 
                  : 'text-white/70 hover:text-white hover:bg-white/10'
              }`}
            >
              Snapshot
            </Link>
            <Link 
              to="/analysis" 
              className={`px-4 py-2 rounded-full transition-all duration-300 ${
                isActive('/analysis') 
                  ? 'bg-gradient-to-r from-accent-green to-accent-teal text-white shadow-glow' 
                  : 'text-white/70 hover:text-white hover:bg-white/10'
              }`}
            >
              Analysis
            </Link>
            <Link 
              to="/events" 
              className={`px-4 py-2 rounded-full transition-all duration-300 ${
                isActive('/events') 
                  ? 'bg-gradient-to-r from-accent-green to-accent-teal text-white shadow-glow' 
                  : 'text-white/70 hover:text-white hover:bg-white/10'
              }`}
            >
              Events
            </Link>
            <Link 
              to="/key-deals" 
              className={`px-4 py-2 rounded-full transition-all duration-300 ${
                isActive('/key-deals') 
                  ? 'bg-gradient-to-r from-accent-green to-accent-teal text-white shadow-glow' 
                  : 'text-white/70 hover:text-white hover:bg-white/10'
              }`}
            >
              Key Deals
            </Link>
          </div>
          
          {/* CTA Button */}
          <div className="flex items-center space-x-4">
            {user ? (
              <>
                <span className="hidden md:inline-flex text-white/70 text-sm">
                  {user.email}
                </span>
                <Button 
                  variant="ghost" 
                  onClick={handleSignOut}
                  className="hidden md:inline-flex text-white/70 hover:text-white hover:bg-white/10"
                >
                  Sign Out
                </Button>
              </>
            ) : (
              <>
                <Link to="/auth">
                  <Button variant="ghost" className="hidden md:inline-flex text-white/70 hover:text-white hover:bg-white/10">
                    Sign In
                  </Button>
                </Link>
                <Link to="/auth">
                  <Button className="bg-gradient-to-r from-green-500 to-green-600 hover:from-green-600 hover:to-green-700 text-black font-semibold transition-all duration-300 hover:scale-105 rounded-full">
                    Get Started
                  </Button>
                </Link>
              </>
            )}
          </div>
        </div>
      </div>
      </nav>
    </div>
  )
}