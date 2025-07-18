import { Navigation } from "@/components/Navigation"
import { Footer } from "@/components/Footer"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Calendar, MapPin, Users, ArrowRight } from "lucide-react"

const upcomingEvents = [
  {
    title: "Global Carbon Markets Summit 2024",
    date: "March 15-17, 2024",
    location: "Geneva, Switzerland",
    attendees: "750+",
    description: "International summit on carbon credit trading, forest preservation initiatives, and sustainable investment strategies.",
    type: "Summit"
  },
  {
    title: "Water Rights & Resources Forum",
    date: "April 8, 2024",
    location: "Singapore",
    attendees: "300+",
    description: "Strategic discussions on global water scarcity, aquifer rights, and blue economy investments.",
    type: "Forum"
  },
  {
    title: "Rare Earth Minerals Conference",
    date: "April 22, 2024",
    location: "Perth, Australia",
    attendees: "400+",
    description: "Exploration of sustainable mining practices and critical mineral supply chains.",
    type: "Conference"
  }
]

export default function Events() {
  return (
    <div className="min-h-screen font-primary bg-black">
      <Navigation />
      
      {/* Hero Section */}
      <section className="relative pt-32 pb-20 overflow-hidden bg-gradient-hero">
        {/* Natural landscape background */}
        <div className="absolute inset-0 opacity-30">
          <svg viewBox="0 0 1200 800" className="absolute inset-0 w-full h-full">
            <defs>
              <linearGradient id="forestGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%" stopColor="hsl(140 40% 30%)" stopOpacity="0.6" />
                <stop offset="50%" stopColor="hsl(195 60% 50%)" stopOpacity="0.4" />
                <stop offset="100%" stopColor="hsl(25 35% 25%)" stopOpacity="0.3" />
              </linearGradient>
            </defs>
            
            {/* Mountain ranges */}
            <path d="M0,400 C200,250 400,350 600,200 C800,300 1000,150 1200,300 L1200,800 L0,800 Z" fill="url(#forestGradient)" />
            <path d="M0,500 C300,350 600,450 900,300 L1200,400 L1200,800 L0,800 Z" fill="hsl(210 25% 8%)" opacity="0.7" />
          </svg>
        </div>

        {/* Floating natural elements */}
        <div className="absolute top-20 left-10 w-16 h-16 bg-forest-green/20 rounded-full animate-float"></div>
        <div className="absolute top-32 right-20 w-12 h-20 bg-glacier-blue/20 rounded-full animate-float" style={{ animationDelay: '1.5s' }}></div>
        <div className="absolute bottom-20 left-1/3 w-20 h-12 bg-earth-brown/20 rounded-full animate-float" style={{ animationDelay: '0.5s' }}></div>
        
        <div className="relative max-w-7xl mx-auto px-6 lg:px-8">
          <div className="text-center max-w-4xl mx-auto">
            <h1 className="text-5xl md:text-7xl font-bold text-foreground mb-8 leading-tight uppercase tracking-tight">
              Resource
              <span className="block text-glacier-blue">
                Gatherings
              </span>
            </h1>
            <p className="text-xl md:text-2xl text-foreground/70 mb-12 leading-relaxed">
              Connect with the natural resources ecosystem through exclusive summits, 
              sustainability conferences, and conservation networking opportunities.
            </p>
          </div>
        </div>
      </section>

      {/* Upcoming Events */}
      <section className="py-20 bg-background">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-6">
              Upcoming Gatherings
            </h2>
            <p className="text-xl text-foreground/70">
              Don't miss these critical natural resource events
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {upcomingEvents.map((event, index) => (
              <Card 
                key={index}
                className="group hover:shadow-lift transition-all duration-300 hover:-translate-y-2 bg-gray-900/50 backdrop-blur-sm border-gray-800 overflow-hidden"
              >
                <CardHeader className="relative">
                  <div className="absolute top-4 right-4">
                    <span className="px-3 py-1 bg-green-500/10 text-green-400 rounded-full text-xs font-medium">
                      {event.type}
                    </span>
                  </div>
                  <CardTitle className="text-xl font-bold text-white pr-20">
                    {event.title}
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <CardDescription className="text-white/70 leading-relaxed">
                    {event.description}
                  </CardDescription>
                  
                  <div className="space-y-3">
                    <div className="flex items-center text-sm text-white/70">
                      <Calendar className="w-4 h-4 mr-2 text-green-400" />
                      {event.date}
                    </div>
                    <div className="flex items-center text-sm text-white/70">
                      <MapPin className="w-4 h-4 mr-2 text-teal-400" />
                      {event.location}
                    </div>
                    <div className="flex items-center text-sm text-white/70">
                      <Users className="w-4 h-4 mr-2 text-cyan-400" />
                      {event.attendees} expected attendees
                    </div>
                  </div>
                  
                  <Button className="w-full mt-6 bg-gradient-to-r from-green-500 to-teal-500 hover:from-green-600 hover:to-teal-600 text-white transition-all duration-300 group-hover:scale-105">
                    Learn More
                    <ArrowRight className="ml-2 w-4 h-4" />
                  </Button>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Event Categories */}
      <section className="py-20 bg-black">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-white mb-6">
              Event Categories
            </h2>
          </div>

          <div className="grid md:grid-cols-4 gap-6">
            {[
              { name: "Conferences", count: "12", color: "green-400" },
              { name: "Networking", count: "8", color: "teal-400" },
              { name: "Workshops", count: "6", color: "cyan-400" },
              { name: "Webinars", count: "15", color: "blue-400" }
            ].map((category, index) => (
              <div 
                key={category.name}
                className="text-center p-8 bg-gray-900/50 backdrop-blur-sm rounded-3xl shadow-lift border border-gray-800 hover:shadow-lift transition-all duration-300 hover:-translate-y-1"
              >
                <div className={`text-4xl font-bold text-${category.color} mb-2`}>
                  {category.count}
                </div>
                <div className="text-white/70 font-medium">
                  {category.name}
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      <Footer />
    </div>
  )
}