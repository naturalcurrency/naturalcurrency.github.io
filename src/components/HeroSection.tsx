import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Leaf, ArrowRight, TreePine } from "lucide-react"

export function HeroSection() {
  return (
    <section className="relative min-h-screen bg-gradient-hero overflow-hidden">
      {/* Mountain silhouette and atmospheric background */}
      <div className="absolute inset-0">
        <svg viewBox="0 0 1200 800" className="absolute inset-0 w-full h-full opacity-40">
          <defs>
            <linearGradient id="mountainGradient" x1="0%" y1="0%" x2="100%" y2="100%">
              <stop offset="0%" stopColor="hsl(210 50% 35%)" stopOpacity="0.8" />
              <stop offset="50%" stopColor="hsl(195 60% 50%)" stopOpacity="0.6" />
              <stop offset="100%" stopColor="hsl(180 25% 45%)" stopOpacity="0.3" />
            </linearGradient>
            <radialGradient id="moonGlow" cx="85%" cy="15%" r="20%">
              <stop offset="0%" stopColor="hsl(195 60% 80%)" stopOpacity="0.8" />
              <stop offset="100%" stopColor="hsl(195 60% 50%)" stopOpacity="0.1" />
            </radialGradient>
          </defs>
          
          {/* Mountain ranges */}
          <path 
            d="M0,600 L200,400 L400,500 L600,300 L800,450 L1000,250 L1200,400 L1200,800 L0,800 Z" 
            fill="url(#mountainGradient)"
            className="animate-pulse"
          />
          <path 
            d="M0,650 L300,500 L500,550 L700,400 L900,520 L1200,450 L1200,800 L0,800 Z" 
            fill="hsl(210 25% 8%)"
            opacity="0.8"
          />
          
          {/* Moon/light source */}
          <circle cx="85%" cy="15%" r="40" fill="url(#moonGlow)" />
          
          {/* Floating particles */}
          <circle cx="15%" cy="30%" r="2" fill="hsl(195 60% 50%)" opacity="0.6" className="animate-float">
            <animate attributeName="cy" values="30%;25%;30%" dur="4s" repeatCount="indefinite"/>
          </circle>
          <circle cx="75%" cy="45%" r="1.5" fill="hsl(45 85% 60%)" opacity="0.5" className="animate-float" style={{ animationDelay: '2s' }}>
            <animate attributeName="cy" values="45%;40%;45%" dur="6s" repeatCount="indefinite"/>
          </circle>
        </svg>
      </div>

      {/* Deer silhouette - inspired by reference image */}
      <div className="absolute bottom-20 right-1/4 opacity-60">
        <svg width="200" height="150" viewBox="0 0 200 150" className="fill-current text-stone-gray">
          <path d="M80,120 Q75,100 85,85 Q90,75 95,85 L100,80 Q105,70 110,75 L115,70 Q120,65 125,70 L130,75 Q135,70 140,75 L135,85 Q140,90 135,95 L140,100 Q145,110 135,115 L130,120 Q125,130 115,125 L105,130 Q95,135 85,130 L80,120 Z"/>
          <path d="M95,85 L90,70 M100,80 L95,65 M110,75 L105,60 M125,70 L120,55 M140,75 L135,60"/>
          <circle cx="105" cy="90" r="2"/>
          <path d="M85,130 L75,145 M135,115 L145,130 M115,125 L125,140 M105,130 L95,145"/>
        </svg>
      </div>

      {/* Social links sidebar - like reference */}
      <div className="fixed left-6 top-1/2 -translate-y-1/2 z-20 hidden lg:flex flex-col space-y-6">
        <div className="w-px h-16 bg-gradient-to-b from-transparent via-glacier-blue to-transparent"></div>
        <div className="text-xs text-foreground/60 font-medium -rotate-90 transform origin-center whitespace-nowrap">
          EXPLORE RESOURCES
        </div>
        <div className="w-px h-16 bg-gradient-to-b from-glacier-blue via-transparent to-transparent"></div>
      </div>

      {/* Main Content */}
      <div className="relative max-w-7xl mx-auto px-6 lg:px-8 pt-32 pb-20 min-h-screen flex items-center">
        <div className="w-full max-w-5xl">
          {/* Notification Badge */}
          <div className="mb-8">
            <Badge variant="secondary" className="bg-glacier-blue/10 text-glacier-blue border-glacier-blue/20 backdrop-blur-sm">
              <Leaf className="w-4 h-4 mr-2" />
              Carbon credits market reaches $2B milestone
            </Badge>
          </div>
          
          {/* Main Headline - Inspired by reference image typography */}
          <h1 className="text-6xl md:text-7xl lg:text-8xl xl:text-9xl font-bold leading-tight mb-8 text-white uppercase tracking-tight">
            <span className="block mb-4">EXPLORE</span>
            <span className="block mb-4">EARTH'S</span>
            <span className="block text-glacier-blue">
              NATURAL
            </span>
            <span className="block text-mineral-gold">
              ASSETS
            </span>
          </h1>
          
          {/* Subheading */}
          <p className="text-lg md:text-xl text-foreground/70 mb-12 max-w-2xl leading-relaxed">
            Navigate the dynamic world of natural resource transactions. 
            Explore the value, trade, and sustainability of earth's most precious assets.
          </p>
          
          {/* CTAs */}
          <div className="flex flex-col sm:flex-row items-start gap-6">
            <Button 
              size="lg"
              className="bg-gradient-button hover:shadow-glow text-white font-semibold px-8 py-4 text-lg transition-all duration-300 hover:scale-105 rounded-full"
            >
              EXPLORE THE MARKETS
              <ArrowRight className="ml-2 w-5 h-5" />
            </Button>
            
            <button className="text-foreground/70 hover:text-white font-medium text-lg underline underline-offset-4 transition-colors flex items-center">
              <TreePine className="w-5 h-5 mr-2" />
              VIEW RESOURCES
            </button>
          </div>
        </div>

        {/* Resource cards sidebar - inspired by reference image */}
        <div className="hidden xl:flex flex-col space-y-6 absolute right-8 top-1/2 -translate-y-1/2 w-80">
          <div className="bg-card/50 backdrop-blur-md border border-border rounded-2xl p-6 shadow-card">
            <h3 className="text-lg font-semibold text-foreground mb-2">Carbon Forests</h3>
            <p className="text-sm text-foreground/70 mb-4">Premium reforestation projects delivering verified carbon offsets.</p>
            <div className="flex justify-between items-center">
              <span className="text-2xl font-bold text-mineral-gold">$247.00</span>
              <Button size="sm" variant="outline" className="text-xs">
                See details
              </Button>
            </div>
          </div>
          
          <div className="bg-card/50 backdrop-blur-md border border-border rounded-2xl p-6 shadow-card">
            <h3 className="text-lg font-semibold text-foreground mb-2">Mineral Rights</h3>
            <p className="text-sm text-foreground/70 mb-4">Strategic access to sustainable rare earth mining operations.</p>
            <div className="flex justify-between items-center">
              <span className="text-2xl font-bold text-glacier-blue">$189.00</span>
              <Button size="sm" variant="outline" className="text-xs">
                See details
              </Button>
            </div>
          </div>
          
          <div className="bg-card/50 backdrop-blur-md border border-border rounded-2xl p-6 shadow-card">
            <h3 className="text-lg font-semibold text-foreground mb-2">Water Resources</h3>
            <p className="text-sm text-foreground/70 mb-4">Clean freshwater access rights in emerging markets.</p>
            <div className="flex justify-between items-center">
              <span className="text-2xl font-bold text-forest-green">$325.00</span>
              <Button size="sm" variant="outline" className="text-xs">
                See details
              </Button>
            </div>
          </div>
        </div>

        {/* Partner logos */}
        <div className="absolute bottom-8 left-8 right-8 flex justify-center space-x-12 opacity-30">
          <div className="text-xs font-semibold text-foreground/60 tracking-wider">GREENTECH</div>
          <div className="text-xs font-semibold text-foreground/60 tracking-wider">ECO VENTURES</div>
          <div className="text-xs font-semibold text-foreground/60 tracking-wider">CARBON TRUST</div>
          <div className="text-xs font-semibold text-foreground/60 tracking-wider">TERRA FUND</div>
        </div>
      </div>
    </section>
  )
}