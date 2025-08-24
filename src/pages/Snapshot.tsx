import { useState, useEffect } from "react"
import { Navigation } from "@/components/Navigation"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { TrendingUp, TrendingDown, Droplets, Zap, Mountain, Trees } from "lucide-react"
import { SnapshotFilters } from "@/components/SnapshotFilters"
import { supabase } from "@/integrations/supabase/client"

interface MarketMetric {
  id: string
  metric_name: string
  metric_category: string
  current_value: string
  change_percentage: number | null
  change_direction: string | null
  region_id: string | null
  country_id: string | null
  administrative_division_id: string | null
  sector_id: string | null
  sub_sector_id: string | null
}

export default function Snapshot() {
  const [marketMetrics, setMarketMetrics] = useState<MarketMetric[]>([])
  const [filteredMetrics, setFilteredMetrics] = useState<MarketMetric[]>([])
  const [activeFilters, setActiveFilters] = useState<Record<string, string>>({})
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetchMarketMetrics()
  }, [])

  useEffect(() => {
    applyFilters()
  }, [marketMetrics, activeFilters])

  const fetchMarketMetrics = async () => {
    try {
      const { data, error } = await supabase
        .from('snapshot_market_metrics')
        .select('*')
        .order('metric_name')
      
      if (error) throw error
      
      setMarketMetrics(data || [])
    } catch (error) {
      console.error('Error fetching market metrics:', error)
    } finally {
      setLoading(false)
    }
  }

  const applyFilters = () => {
    let filtered = marketMetrics

    if (activeFilters.regionId) {
      filtered = filtered.filter(metric => metric.region_id === activeFilters.regionId)
    }
    if (activeFilters.countryId) {
      filtered = filtered.filter(metric => metric.country_id === activeFilters.countryId)
    }
    if (activeFilters.administrativeDivisionId) {
      filtered = filtered.filter(metric => metric.administrative_division_id === activeFilters.administrativeDivisionId)
    }
    if (activeFilters.sectorId) {
      filtered = filtered.filter(metric => metric.sector_id === activeFilters.sectorId)
    }
    if (activeFilters.subSectorId) {
      filtered = filtered.filter(metric => metric.sub_sector_id === activeFilters.subSectorId)
    }

    setFilteredMetrics(filtered)
  }

  const handleFiltersChange = (filters: Record<string, string>) => {
    setActiveFilters(filters)
  }
  return (
    <div className="min-h-screen bg-background">
      <Navigation />
      
      {/* Hero Section */}
      <div className="relative pt-32 pb-20 overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-b from-forest-dark/20 to-transparent"></div>
        <div className="max-w-7xl mx-auto px-6 lg:px-8 relative z-10">
          <div className="text-center mb-16">
            <h1 className="text-5xl md:text-7xl font-bold mb-6">
              <span className="text-white">Market</span>
              <span className="block text-transparent bg-gradient-to-r from-accent-green to-accent-teal bg-clip-text">
                Snapshot
              </span>
            </h1>
            <p className="text-xl text-white/80 max-w-3xl mx-auto leading-relaxed">
              Real-time overview of global natural resource markets, trading activity, and sustainability metrics
            </p>
          </div>
        </div>
      </div>

      {/* Filters */}
      <div className="max-w-7xl mx-auto px-6 lg:px-8">
        <SnapshotFilters onFiltersChange={handleFiltersChange} />
      </div>

      {/* Market Overview Grid */}
      <div className="max-w-7xl mx-auto px-6 lg:px-8 pb-20">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
          <Card className="bg-gradient-card border-white/10">
            <CardHeader className="pb-3">
              <div className="flex items-center justify-between">
                <Droplets className="h-8 w-8 text-accent-blue" />
                <Badge variant="secondary" className="bg-accent-blue/20 text-accent-blue border-accent-blue/30">
                  Water
                </Badge>
              </div>
            </CardHeader>
            <CardContent>
              <div className="space-y-2">
                <p className="text-2xl font-bold text-white">$2.4T</p>
                <p className="text-sm text-white/60">Global Water Market</p>
                <div className="flex items-center space-x-2">
                  <TrendingUp className="h-4 w-4 text-accent-green" />
                  <span className="text-sm text-accent-green">+12.5%</span>
                  <span className="text-sm text-white/60">vs last quarter</span>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card className="bg-gradient-card border-white/10">
            <CardHeader className="pb-3">
              <div className="flex items-center justify-between">
                <Zap className="h-8 w-8 text-accent-yellow" />
                <Badge variant="secondary" className="bg-accent-yellow/20 text-accent-yellow border-accent-yellow/30">
                  Energy
                </Badge>
              </div>
            </CardHeader>
            <CardContent>
              <div className="space-y-2">
                <p className="text-2xl font-bold text-white">$8.7T</p>
                <p className="text-sm text-white/60">Renewable Energy</p>
                <div className="flex items-center space-x-2">
                  <TrendingUp className="h-4 w-4 text-accent-green" />
                  <span className="text-sm text-accent-green">+8.3%</span>
                  <span className="text-sm text-white/60">vs last quarter</span>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card className="bg-gradient-card border-white/10">
            <CardHeader className="pb-3">
              <div className="flex items-center justify-between">
                <Mountain className="h-8 w-8 text-earth-brown" />
                <Badge variant="secondary" className="bg-earth-brown/20 text-earth-brown border-earth-brown/30">
                  Minerals
                </Badge>
              </div>
            </CardHeader>
            <CardContent>
              <div className="space-y-2">
                <p className="text-2xl font-bold text-white">$1.9T</p>
                <p className="text-sm text-white/60">Critical Minerals</p>
                <div className="flex items-center space-x-2">
                  <TrendingDown className="h-4 w-4 text-red-400" />
                  <span className="text-sm text-red-400">-3.2%</span>
                  <span className="text-sm text-white/60">vs last quarter</span>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card className="bg-gradient-card border-white/10">
            <CardHeader className="pb-3">
              <div className="flex items-center justify-between">
                <Trees className="h-8 w-8 text-forest-green" />
                <Badge variant="secondary" className="bg-forest-green/20 text-forest-green border-forest-green/30">
                  Carbon
                </Badge>
              </div>
            </CardHeader>
            <CardContent>
              <div className="space-y-2">
                <p className="text-2xl font-bold text-white">$950B</p>
                <p className="text-sm text-white/60">Carbon Credits</p>
                <div className="flex items-center space-x-2">
                  <TrendingUp className="h-4 w-4 text-accent-green" />
                  <span className="text-sm text-accent-green">+18.7%</span>
                  <span className="text-sm text-white/60">vs last quarter</span>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Recent Activity */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <Card className="bg-gradient-card border-white/10">
            <CardHeader>
              <CardTitle className="text-white">Top Performing Resources</CardTitle>
              <CardDescription className="text-white/60">
                Best performing natural resources this week
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {[
                  { name: "Lithium", price: "$24,500/ton", change: "+15.3%", positive: true },
                  { name: "Rare Earth Metals", price: "$8,200/kg", change: "+12.8%", positive: true },
                  { name: "Fresh Water Rights", price: "$1,850/AF", change: "+9.4%", positive: true },
                  { name: "Carbon Credits", price: "$89/tCO2", change: "+7.2%", positive: true },
                ].map((resource, index) => (
                  <div key={index} className="flex items-center justify-between p-3 rounded-lg bg-white/5">
                    <div>
                      <p className="font-medium text-white">{resource.name}</p>
                      <p className="text-sm text-white/60">{resource.price}</p>
                    </div>
                    <div className="flex items-center space-x-2">
                      {resource.positive ? (
                        <TrendingUp className="h-4 w-4 text-accent-green" />
                      ) : (
                        <TrendingDown className="h-4 w-4 text-red-400" />
                      )}
                      <span className={`text-sm font-medium ${resource.positive ? 'text-accent-green' : 'text-red-400'}`}>
                        {resource.change}
                      </span>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          <Card className="bg-gradient-card border-white/10">
            <CardHeader>
              <CardTitle className="text-white">Market Alerts</CardTitle>
              <CardDescription className="text-white/60">
                Important market movements and news
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {[
                  {
                    title: "EU Carbon Border Adjustment",
                    description: "New regulations affecting carbon credit pricing",
                    time: "2 hours ago",
                    type: "regulatory"
                  },
                  {
                    title: "Chilean Lithium Production",
                    description: "Major mine expansion announced, supply increase expected",
                    time: "5 hours ago",
                    type: "supply"
                  },
                  {
                    title: "Water Rights Trading",
                    description: "California drought impacts water market pricing",
                    time: "8 hours ago",
                    type: "market"
                  },
                  {
                    title: "Renewable Energy Certificates",
                    description: "Record trading volume in REC markets",
                    time: "12 hours ago",
                    type: "energy"
                  }
                ].map((alert, index) => (
                  <div key={index} className="p-3 rounded-lg bg-white/5 border-l-4 border-accent-blue">
                    <div className="flex justify-between items-start mb-2">
                      <p className="font-medium text-white text-sm">{alert.title}</p>
                      <span className="text-xs text-white/60">{alert.time}</span>
                    </div>
                    <p className="text-sm text-white/70">{alert.description}</p>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}