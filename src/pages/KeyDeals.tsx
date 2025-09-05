import { Navigation } from "@/components/Navigation"
import { Footer } from "@/components/Footer"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { TrendingUp, Building2, DollarSign, ArrowRight, ExternalLink } from "lucide-react"
import { Link } from "react-router-dom"

const keyDeals = [
  {
    id: "copper-mountain-acquisition",
    title: "Freeport-McMoRan Copper Mountain Expansion",
    amount: "$4.8B",
    date: "March 2024", 
    sector: "Mining & Metals",
    description: "Major expansion of copper mining operations in Arizona, including new processing facilities and increased production capacity to meet growing EV demand.",
    status: "Completed",
    firms: ["Freeport-McMoRan", "Apollo Global Management"],
    multiple: "8.2x",
    location: "Arizona, USA",
    commodity: "Copper",
    reserves: "2.8 billion pounds",
    productionCapacity: "450M lbs/year",
    employees: 3200,
    sustainability: "Carbon-neutral by 2030",
    keyMetrics: {
      revenue: "$18.2B",
      ebitda: "$6.4B",
      capex: "$1.2B",
      reserves: "15+ years"
    }
  },
  {
    id: "lithium-chile-joint-venture", 
    title: "SQM-Albemarle Chilean Lithium JV",
    amount: "$7.2B",
    date: "February 2024",
    sector: "Critical Minerals",
    description: "Strategic joint venture to develop world's largest lithium reserves in Chile's Atacama Desert, targeting battery-grade lithium for global EV market.",
    status: "Pending",
    firms: ["SQM", "Albemarle Corporation", "KKR"],
    multiple: "12.8x",
    location: "Atacama Desert, Chile",
    commodity: "Lithium",
    reserves: "58 million tons LCE",
    productionCapacity: "180,000 MT/year",
    employees: 1850,
    sustainability: "Water-neutral extraction technology",
    keyMetrics: {
      revenue: "$24.7B",
      ebitda: "$11.2B", 
      capex: "$3.8B",
      reserves: "30+ years"
    }
  },
  {
    id: "rare-earth-greenland",
    title: "Greenland Rare Earth Elements Project",
    amount: "$3.4B", 
    date: "January 2024",
    sector: "Rare Earth Elements",
    description: "Development of strategic rare earth mining project in Greenland, focusing on neodymium and dysprosium for wind turbine and EV motor production.",
    status: "Completed",
    firms: ["Energy Transition Ventures", "Blackstone"],
    multiple: "15.4x",
    location: "Kvanefjeld, Greenland",
    commodity: "Rare Earth Elements",
    reserves: "11.8 million tons REO",
    productionCapacity: "35,000 MT/year REO",
    employees: 980,
    sustainability: "Minimal environmental impact protocol",
    keyMetrics: {
      revenue: "$8.9B",
      ebitda: "$4.1B",
      capex: "$2.2B", 
      reserves: "25+ years"
    }
  },
  {
    id: "cobalt-congo-development",
    title: "Glencore DRC Cobalt Expansion",
    amount: "$5.6B",
    date: "December 2023", 
    sector: "Battery Metals",
    description: "Expansion of cobalt mining operations in Democratic Republic of Congo, implementing ethical sourcing standards and community development programs.",
    status: "Completed",
    firms: ["Glencore", "Carlyle Group"],
    multiple: "9.7x",
    location: "Katanga Province, DRC",
    commodity: "Cobalt",
    reserves: "1.2 million tons",
    productionCapacity: "65,000 MT/year",
    employees: 12500,
    sustainability: "Ethical sourcing certification",
    keyMetrics: {
      revenue: "$12.3B",
      ebitda: "$5.8B",
      capex: "$1.9B",
      reserves: "20+ years"
    }
  },
  {
    id: "gold-australia-merger",
    title: "Newmont-Barrick Australian Assets",
    amount: "$8.9B",
    date: "November 2023",
    sector: "Precious Metals", 
    description: "Consolidation of gold mining assets across Australia and Papua New Guinea, creating world's largest gold production platform with advanced automation.",
    status: "Completed",
    firms: ["Newmont Corporation", "Barrick Gold", "TPG Capital"],
    multiple: "6.8x",
    location: "Multiple sites, Australia & PNG", 
    commodity: "Gold",
    reserves: "45 million ounces",
    productionCapacity: "3.2M oz/year",
    employees: 18750,
    sustainability: "Net-zero emissions by 2035",
    keyMetrics: {
      revenue: "$21.4B",
      ebitda: "$8.7B",
      capex: "$2.8B",
      reserves: "18+ years"
    }
  }
]

export default function KeyDeals() {
  return (
    <div className="min-h-screen font-primary bg-black">
      <Navigation />
      
      {/* Hero Section */}
      <section className="relative pt-32 pb-20 overflow-hidden bg-black">
        {/* Wave Pattern Background */}
        <div className="absolute inset-0 opacity-20">
          <svg viewBox="0 0 1200 800" className="absolute inset-0 w-full h-full">
            <path d="M0,600 C300,400 700,800 1200,500 L1200,800 L0,800 Z" fill="url(#keyDealsWave)" />
            <defs>
              <linearGradient id="keyDealsWave" x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%" stopColor="hsl(210 98% 55%)" stopOpacity="0.6" />
                <stop offset="50%" stopColor="hsl(180 84% 40%)" stopOpacity="0.4" />
                <stop offset="100%" stopColor="hsl(142 76% 36%)" stopOpacity="0.2" />
              </linearGradient>
            </defs>
          </svg>
        </div>

        {/* Floating Elements */}
        <div className="absolute top-16 right-16 w-28 h-28 bg-blue-500/20 rounded-3xl rotate-12 animate-float"></div>
        <div className="absolute top-40 left-20 w-20 h-40 bg-green-500/20 rounded-full animate-float" style={{ animationDelay: '2s' }}></div>
        <div className="absolute bottom-10 right-1/3 w-24 h-24 bg-teal-500/20 rounded-2xl -rotate-45 animate-float" style={{ animationDelay: '1s' }}></div>
        
        <div className="relative max-w-7xl mx-auto px-6 lg:px-8">
          <div className="text-center max-w-4xl mx-auto">
            <h1 className="text-5xl md:text-7xl font-bold text-white mb-8 leading-tight">
              Key
              <span className="block text-green-400">
                Deals
              </span>
            </h1>
            <p className="text-xl md:text-2xl text-white/70 mb-12 leading-relaxed">
              Discover major natural resources investments, from critical mineral acquisitions 
              to strategic mining operations powering the global energy transition.
            </p>
          </div>
        </div>
      </section>

      {/* Deal Analytics Overview */}
      <section className="py-20 bg-black">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <div className="grid md:grid-cols-4 gap-6 mb-16">
            <div className="text-center p-8 bg-gray-900/50 backdrop-blur-sm rounded-3xl shadow-lift border border-gray-800">
              <div className="text-4xl font-bold text-white mb-2">
                $847B
              </div>
              <div className="text-white/70 font-medium">Total Deal Value</div>
            </div>
            <div className="text-center p-8 bg-gray-900/50 backdrop-blur-sm rounded-3xl shadow-lift border border-gray-800">
              <div className="text-4xl font-bold text-green-400 mb-2">
                2,543
              </div>
              <div className="text-white/70 font-medium">Transactions</div>
            </div>
            <div className="text-center p-8 bg-gray-900/50 backdrop-blur-sm rounded-3xl shadow-lift border border-gray-800">
              <div className="text-4xl font-bold text-teal-400 mb-2">
                11.2x
              </div>
              <div className="text-white/70 font-medium">Avg Multiple</div>
            </div>
            <div className="text-center p-8 bg-gray-900/50 backdrop-blur-sm rounded-3xl shadow-lift border border-gray-800">
              <div className="text-4xl font-bold text-cyan-400 mb-2">
                +23%
              </div>
              <div className="text-white/70 font-medium">YoY Growth</div>
            </div>
          </div>
        </div>
      </section>

      {/* Recent Key Deals */}
      <section className="py-20 bg-black">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl md:text-5xl font-bold text-white mb-6">
              Recent Transactions
            </h2>
            <p className="text-xl text-white/70">
              Latest high-impact deals in natural resources and critical minerals
            </p>
          </div>

          <div className="space-y-6">
            {keyDeals.map((deal, index) => (
              <Card 
                key={index}
                className="group hover:shadow-lift transition-all duration-300 hover:-translate-y-1 bg-gray-900/50 backdrop-blur-sm border-gray-800"
              >
                <CardHeader>
                  <div className="flex items-start justify-between">
                    <div className="flex-1">
                      <div className="flex items-center space-x-4 mb-3">
                        <CardTitle className="text-2xl font-bold text-white">
                          {deal.title}
                        </CardTitle>
                        <div className={`px-3 py-1 rounded-full text-xs font-medium ${
                          deal.status === 'Completed' 
                            ? 'bg-green-500/10 text-green-400' 
                            : 'bg-yellow-500/10 text-yellow-400'
                        }`}>
                          {deal.status}
                        </div>
                      </div>
                      <CardDescription className="text-white/70 leading-relaxed mb-4">
                        {deal.description}
                      </CardDescription>
                    </div>
                    <div className="text-right ml-6">
                      <div className="text-3xl font-bold text-white">
                        {deal.amount}
                      </div>
                      <div className="text-sm text-white/70">{deal.date}</div>
                    </div>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="grid md:grid-cols-4 gap-6 items-center">
                    <div>
                      <div className="text-sm text-white/70 mb-1">Sector</div>
                      <div className="flex items-center">
                        <Building2 className="w-4 h-4 mr-2 text-green-400" />
                        <span className="font-medium text-white">{deal.sector}</span>
                      </div>
                    </div>
                    <div>
                      <div className="text-sm text-white/70 mb-1">Multiple</div>
                      <div className="flex items-center">
                        <TrendingUp className="w-4 h-4 mr-2 text-teal-400" />
                        <span className="font-medium text-white">{deal.multiple}</span>
                      </div>
                    </div>
                    <div>
                      <div className="text-sm text-white/70 mb-1">Lead Firm</div>
                      <div className="font-medium text-white">{deal.firms[0]}</div>
                    </div>
                    <div className="flex justify-end">
                      <Link to={`/key-deals/${deal.id}`}>
                        <Button 
                          variant="outline" 
                          className="border-gray-700 bg-gray-800 hover:bg-gray-700 text-white transition-all duration-300"
                        >
                          View Details
                          <ExternalLink className="ml-2 w-4 h-4" />
                        </Button>
                      </Link>
                    </div>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Deal Flow Trends */}
      <section className="py-20 bg-black">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-white mb-6">
              Market Trends
            </h2>
          </div>
          
          <div className="grid lg:grid-cols-2 gap-12">
            <div className="bg-gray-900/50 backdrop-blur-sm rounded-3xl p-8 shadow-lift border border-gray-800">
              <h3 className="text-2xl font-bold text-white mb-6">Deal Volume by Sector</h3>
              <div className="space-y-4">
                {[
                  { sector: "Battery Metals", percentage: 38, color: "green-400" },
                  { sector: "Precious Metals", percentage: 24, color: "teal-400" },
                  { sector: "Critical Minerals", percentage: 22, color: "cyan-400" },
                  { sector: "Rare Earth Elements", percentage: 16, color: "blue-400" }
                ].map((item, index) => (
                  <div key={index} className="flex items-center justify-between">
                    <div className="flex items-center">
                      <div className={`w-4 h-4 bg-${item.color} rounded-full mr-3`}></div>
                      <span className="text-white font-medium">{item.sector}</span>
                    </div>
                    <div className="flex items-center space-x-3">
                      <div className="flex-1 h-2 bg-gray-700 rounded-full overflow-hidden w-24">
                        <div 
                          className={`h-full bg-${item.color} rounded-full`}
                          style={{ width: `${item.percentage}%` }}
                        ></div>
                      </div>
                      <span className="text-white/70 font-medium w-8">{item.percentage}%</span>
                    </div>
                  </div>
                ))}
              </div>
            </div>
            
            <div className="bg-gray-900/50 backdrop-blur-sm rounded-3xl p-8 shadow-lift border border-gray-800">
              <h3 className="text-2xl font-bold text-white mb-6">Average Deal Size Trend</h3>
              <div className="h-48 bg-gradient-to-br from-green-500/5 to-teal-500/5 rounded-2xl flex items-end justify-around p-4">
                <div className="w-8 bg-gradient-to-t from-green-500/50 to-green-500 h-24 rounded-t"></div>
                <div className="w-8 bg-gradient-to-t from-green-500/50 to-green-500 h-32 rounded-t"></div>
                <div className="w-8 bg-gradient-to-t from-green-500/50 to-green-500 h-28 rounded-t"></div>
                <div className="w-8 bg-gradient-to-t from-green-500/50 to-green-500 h-36 rounded-t"></div>
                <div className="w-8 bg-gradient-to-t from-green-500/50 to-green-500 h-40 rounded-t"></div>
                <div className="w-8 bg-gradient-to-t from-green-500/50 to-green-500 h-44 rounded-t"></div>
              </div>
              <div className="mt-4 text-center">
                <span className="text-white/70 text-sm">Consistent growth in average deal sizes</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </div>
  )
}