import { useParams, Link } from "react-router-dom"
import { Navigation } from "@/components/Navigation"
import { Footer } from "@/components/Footer"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { ArrowLeft, MapPin, Users, Factory, Leaf, TrendingUp, DollarSign, Calendar, Building2 } from "lucide-react"

const dealData = {
  "copper-mountain-acquisition": {
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
    },
    overview: "The Copper Mountain expansion represents one of the largest copper development projects in North America, strategically positioned to meet the surge in demand from the electric vehicle and renewable energy sectors. The project includes state-of-the-art processing facilities, advanced automation systems, and sustainable mining practices.",
    dealStructure: "The transaction was structured as a joint venture between Freeport-McMoRan and Apollo Global Management, with Freeport maintaining operational control while Apollo provides strategic capital and expertise in infrastructure development.",
    marketContext: "With global copper demand expected to double by 2035 due to electrification trends, this expansion positions the consortium to capture significant value from the energy transition. The project's proximity to major manufacturing hubs provides logistical advantages.",
    riskFactors: ["Commodity price volatility", "Environmental regulatory changes", "Labor market constraints", "Geopolitical supply chain risks"],
    timeline: [
      { phase: "Deal Announcement", date: "December 2023", status: "completed" },
      { phase: "Regulatory Approval", date: "February 2024", status: "completed" },
      { phase: "Financial Close", date: "March 2024", status: "completed" },
      { phase: "Construction Phase 1", date: "Q2 2024", status: "in-progress" },
      { phase: "Production Ramp-up", date: "Q4 2025", status: "planned" }
    ]
  },
  "lithium-chile-joint-venture": {
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
    },
    overview: "This landmark joint venture combines the world's two largest lithium producers to create an unparalleled production platform in Chile's lithium-rich Atacama Desert. The partnership leverages innovative direct lithium extraction (DLE) technology to minimize environmental impact while maximizing output.",
    dealStructure: "50-50 joint venture between SQM and Albemarle with KKR providing strategic capital and operational expertise. The structure includes technology sharing agreements and coordinated marketing strategies for battery-grade lithium carbonate and hydroxide.",
    marketContext: "Lithium demand is projected to increase 40x by 2040 driven by EV adoption and grid storage. This JV controls approximately 35% of global lithium reserves, providing significant pricing power in the critical battery supply chain.",
    riskFactors: ["Chilean regulatory changes", "Water usage restrictions", "Technology development risks", "Demand volatility in EV sector"],
    timeline: [
      { phase: "Initial Agreement", date: "November 2023", status: "completed" },
      { phase: "Due Diligence", date: "January 2024", status: "completed" },
      { phase: "Regulatory Filing", date: "February 2024", status: "completed" },
      { phase: "Government Approval", date: "Q2 2024", status: "pending" },
      { phase: "Operations Integration", date: "Q1 2025", status: "planned" }
    ]
  },
  "rare-earth-greenland": {
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
    },
    overview: "The Kvanefjeld project represents the largest rare earth elements development outside of China, focusing on critical elements essential for clean energy technologies. The project employs cutting-edge extraction methods designed for the Arctic environment while maintaining strict environmental standards.",
    dealStructure: "Strategic partnership between Energy Transition Ventures (60%) and Blackstone (40%) with performance-based earnouts tied to production milestones. The deal includes technology licensing agreements and offtake contracts with major automotive OEMs.",
    marketContext: "Rare earth elements are essential for wind turbine generators and EV motors, with 90% of supply currently controlled by China. This project provides critical supply chain diversification for Western clean energy manufacturing.",
    riskFactors: ["Extreme weather conditions", "Environmental permitting", "Geopolitical tensions", "Technology scaling challenges"],
    timeline: [
      { phase: "Environmental Impact Study", date: "June 2023", status: "completed" },
      { phase: "Investment Decision", date: "October 2023", status: "completed" },
      { phase: "Financial Close", date: "January 2024", status: "completed" },
      { phase: "Construction Start", date: "March 2024", status: "in-progress" },
      { phase: "First Production", date: "Q3 2025", status: "planned" }
    ]
  },
  "cobalt-congo-development": {
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
    },
    overview: "This expansion project transforms Glencore's cobalt operations in the DRC into the world's most advanced and ethically compliant cobalt production facility. The project includes comprehensive community development initiatives and sets new industry standards for responsible mining.",
    dealStructure: "Strategic partnership with Carlyle Group providing growth capital and ESG expertise. The structure includes milestone-based funding tied to sustainability and community development objectives, with shared governance on operational decisions.",
    marketContext: "The DRC produces 70% of global cobalt, essential for lithium-ion batteries. This expansion addresses growing battery demand while establishing industry-leading ethical sourcing practices that meet automotive OEM requirements.",
    riskFactors: ["Political instability", "Community relations", "Regulatory compliance", "Infrastructure development"],
    timeline: [
      { phase: "Partnership Agreement", date: "September 2023", status: "completed" },
      { phase: "Community Consultation", date: "November 2023", status: "completed" },
      { phase: "Investment Close", date: "December 2023", status: "completed" },
      { phase: "Infrastructure Development", date: "Q1 2024", status: "in-progress" },
      { phase: "Production Expansion", date: "Q4 2024", status: "planned" }
    ]
  },
  "gold-australia-merger": {
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
    },
    overview: "The merger creates the world's premier gold mining platform, combining complementary assets across Australia and Papua New Guinea. The consolidated operations leverage advanced automation and AI-driven optimization to achieve industry-leading cost efficiency and safety standards.",
    dealStructure: "Three-way merger with Newmont and Barrick contributing assets and TPG Capital providing growth funding. The structure includes contingent value rights tied to gold price performance and operational synergies realization.",
    marketContext: "Gold remains a critical portfolio diversifier and inflation hedge in uncertain macroeconomic conditions. The merged entity controls strategic reserves in stable jurisdictions with established mining infrastructure.",
    riskFactors: ["Commodity price cycles", "Regulatory changes", "Integration complexity", "Environmental compliance"],
    timeline: [
      { phase: "Strategic Review", date: "March 2023", status: "completed" },
      { phase: "Merger Agreement", date: "August 2023", status: "completed" },
      { phase: "Regulatory Approval", date: "October 2023", status: "completed" },
      { phase: "Transaction Close", date: "November 2023", status: "completed" },
      { phase: "Integration Phase", date: "Q1 2024", status: "in-progress" }
    ]
  }
}

export default function DealDetails() {
  const { dealId } = useParams()
  const deal = dealId ? dealData[dealId as keyof typeof dealData] : null

  if (!deal) {
    return (
      <div className="min-h-screen font-primary bg-black flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-4xl font-bold text-white mb-4">Deal Not Found</h1>
          <Link to="/key-deals">
            <Button variant="outline" className="border-gray-700 bg-gray-800 hover:bg-gray-700 text-white">
              <ArrowLeft className="mr-2 w-4 h-4" />
              Back to Key Deals
            </Button>
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen font-primary bg-black">
      <Navigation />
      
      {/* Header */}
      <section className="pt-32 pb-12 bg-black">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <div className="mb-8">
            <Link to="/key-deals">
              <Button variant="ghost" className="text-white hover:bg-gray-800 mb-6">
                <ArrowLeft className="mr-2 w-4 h-4" />
                Back to Key Deals
              </Button>
            </Link>
          </div>
          
          <div className="flex items-start justify-between">
            <div className="flex-1">
              <div className="flex items-center space-x-4 mb-4">
                <h1 className="text-4xl md:text-5xl font-bold text-white">
                  {deal.title}
                </h1>
                <Badge className={`${
                  deal.status === 'Completed' 
                    ? 'bg-green-500/10 text-green-400 border-green-500/20' 
                    : 'bg-yellow-500/10 text-yellow-400 border-yellow-500/20'
                }`}>
                  {deal.status}
                </Badge>
              </div>
              <p className="text-xl text-white/70 leading-relaxed mb-6">
                {deal.description}
              </p>
            </div>
            <div className="text-right ml-8">
              <div className="text-5xl font-bold text-white mb-2">
                {deal.amount}
              </div>
              <div className="text-white/70">{deal.date}</div>
            </div>
          </div>
        </div>
      </section>

      {/* Key Metrics */}
      <section className="py-12 bg-black">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <div className="grid md:grid-cols-4 gap-6 mb-12">
            <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800">
              <CardHeader className="pb-2">
                <CardTitle className="text-sm text-white/70 font-medium">Revenue</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold text-white">{deal.keyMetrics.revenue}</div>
              </CardContent>
            </Card>
            <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800">
              <CardHeader className="pb-2">
                <CardTitle className="text-sm text-white/70 font-medium">EBITDA</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold text-green-400">{deal.keyMetrics.ebitda}</div>
              </CardContent>
            </Card>
            <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800">
              <CardHeader className="pb-2">
                <CardTitle className="text-sm text-white/70 font-medium">Multiple</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold text-teal-400">{deal.multiple}</div>
              </CardContent>
            </Card>
            <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800">
              <CardHeader className="pb-2">
                <CardTitle className="text-sm text-white/70 font-medium">Reserve Life</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold text-cyan-400">{deal.keyMetrics.reserves}</div>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Deal Overview */}
      <section className="py-12 bg-black">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <div className="grid lg:grid-cols-3 gap-8">
            <div className="lg:col-span-2">
              <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800 mb-8">
                <CardHeader>
                  <CardTitle className="text-2xl text-white">Deal Overview</CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-white/70 leading-relaxed">
                    {deal.overview}
                  </p>
                </CardContent>
              </Card>

              <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800 mb-8">
                <CardHeader>
                  <CardTitle className="text-2xl text-white">Deal Structure</CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-white/70 leading-relaxed">
                    {deal.dealStructure}
                  </p>
                </CardContent>
              </Card>

              <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800">
                <CardHeader>
                  <CardTitle className="text-2xl text-white">Market Context</CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-white/70 leading-relaxed">
                    {deal.marketContext}
                  </p>
                </CardContent>
              </Card>
            </div>

            <div>
              <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800 mb-8">
                <CardHeader>
                  <CardTitle className="text-xl text-white">Key Details</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="flex items-center">
                    <MapPin className="w-5 h-5 mr-3 text-green-400" />
                    <div>
                      <div className="text-sm text-white/70">Location</div>
                      <div className="font-medium text-white">{deal.location}</div>
                    </div>
                  </div>
                  <div className="flex items-center">
                    <Building2 className="w-5 h-5 mr-3 text-teal-400" />
                    <div>
                      <div className="text-sm text-white/70">Commodity</div>
                      <div className="font-medium text-white">{deal.commodity}</div>
                    </div>
                  </div>
                  <div className="flex items-center">
                    <Factory className="w-5 h-5 mr-3 text-cyan-400" />
                    <div>
                      <div className="text-sm text-white/70">Production Capacity</div>
                      <div className="font-medium text-white">{deal.productionCapacity}</div>
                    </div>
                  </div>
                  <div className="flex items-center">
                    <Users className="w-5 h-5 mr-3 text-blue-400" />
                    <div>
                      <div className="text-sm text-white/70">Employees</div>
                      <div className="font-medium text-white">{deal.employees.toLocaleString()}</div>
                    </div>
                  </div>
                  <div className="flex items-center">
                    <Leaf className="w-5 h-5 mr-3 text-emerald-400" />
                    <div>
                      <div className="text-sm text-white/70">Sustainability</div>
                      <div className="font-medium text-white">{deal.sustainability}</div>
                    </div>
                  </div>
                </CardContent>
              </Card>

              <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800 mb-8">
                <CardHeader>
                  <CardTitle className="text-xl text-white">Investment Firms</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3">
                    {deal.firms.map((firm, index) => (
                      <div key={index} className="p-3 bg-gray-800/50 rounded-lg">
                        <div className="font-medium text-white">{firm}</div>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>

              <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800">
                <CardHeader>
                  <CardTitle className="text-xl text-white">Risk Factors</CardTitle>
                </CardHeader>
                <CardContent>
                  <ul className="space-y-2">
                    {deal.riskFactors.map((risk, index) => (
                      <li key={index} className="text-white/70 text-sm">
                        • {risk}
                      </li>
                    ))}
                  </ul>
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </section>

      {/* Timeline */}
      <section className="py-12 bg-black">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <Card className="bg-gray-900/50 backdrop-blur-sm border-gray-800">
            <CardHeader>
              <CardTitle className="text-2xl text-white">Deal Timeline</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-6">
                {deal.timeline.map((item, index) => (
                  <div key={index} className="flex items-center">
                    <div className={`w-4 h-4 rounded-full mr-6 ${
                      item.status === 'completed' ? 'bg-green-400' :
                      item.status === 'in-progress' ? 'bg-yellow-400' : 'bg-gray-600'
                    }`}></div>
                    <div className="flex-1">
                      <div className="flex items-center justify-between">
                        <div className="font-medium text-white">{item.phase}</div>
                        <div className="text-sm text-white/70">{item.date}</div>
                      </div>
                      <div className={`text-sm ${
                        item.status === 'completed' ? 'text-green-400' :
                        item.status === 'in-progress' ? 'text-yellow-400' : 'text-gray-400'
                      }`}>
                        {item.status.charAt(0).toUpperCase() + item.status.slice(1).replace('-', ' ')}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </div>
      </section>

      <Footer />
    </div>
  )
}