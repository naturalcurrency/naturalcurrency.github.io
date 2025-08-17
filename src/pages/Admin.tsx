import { useState } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { Badge } from '@/components/ui/badge'
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table'
import { Switch } from '@/components/ui/switch'
import { CalendarIcon, Users, TrendingUp, FileText, Calendar, Settings, Plus, Edit, Trash2, Eye, BarChart3, Activity, Globe, Leaf } from 'lucide-react'
import { toast } from '@/hooks/use-toast'

interface AnalysisReport {
  id: number
  title: string
  category: string
  author: string
  status: 'published' | 'draft'
  featured: boolean
  createdAt: string
  views: number
  resourceType: string
}

interface ResourceEvent {
  id: number
  title: string
  type: string
  date: string
  location: string
  capacity: number
  registered: number
  status: 'published' | 'draft'
  featured: boolean
  resourceFocus: string
}

interface KeyDeal {
  id: number
  dealName: string
  resource: string
  value: string
  parties: string
  status: 'active' | 'completed' | 'pending'
  featured: boolean
  region: string
  sustainability: number
}

interface SnapshotMetric {
  id: number
  label: string
  value: string
  change: string
  isPositive: boolean
  isActive: boolean
  category: string
}

export default function Admin() {
  const [analysisReports, setAnalysisReports] = useState<AnalysisReport[]>([
    { id: 1, title: "Global Water Resources Market Analysis", category: "Water Resources", author: "Dr. Sarah Chen", status: "published", featured: true, createdAt: "2024-01-15", views: 1850, resourceType: "Water" },
    { id: 2, title: "Rare Earth Mining Sustainability Report", category: "Mining", author: "Michael Rodriguez", status: "published", featured: false, createdAt: "2024-01-12", views: 1240, resourceType: "Minerals" },
    { id: 3, title: "Carbon Credit Market Dynamics", category: "Carbon Trading", author: "Dr. Elena Vasquez", status: "draft", featured: false, createdAt: "2024-01-10", views: 0, resourceType: "Carbon" }
  ])

  const [resourceEvents, setResourceEvents] = useState<ResourceEvent[]>([
    { id: 1, title: "Global Carbon Markets Summit 2024", type: "Conference", date: "2024-03-15", location: "Geneva", capacity: 800, registered: 647, status: "published", featured: true, resourceFocus: "Carbon Trading" },
    { id: 2, title: "Sustainable Mining Workshop", type: "Workshop", date: "2024-02-20", location: "Virtual", capacity: 200, registered: 178, status: "published", featured: false, resourceFocus: "Mining" },
    { id: 3, title: "Water Rights & Trading Forum", type: "Panel", date: "2024-04-05", location: "Cape Town", capacity: 300, registered: 0, status: "draft", featured: false, resourceFocus: "Water" }
  ])

  const [keyDeals, setKeyDeals] = useState<KeyDeal[]>([
    { id: 1, dealName: "Amazon Basin Carbon Credits", resource: "Carbon Offsets", value: "$2.8B", parties: "GreenTech Corp / Indigenous Coalition", status: "active", featured: true, region: "South America", sustainability: 95 },
    { id: 2, dealName: "Lithium Mining Rights - Chile", resource: "Lithium", value: "$1.2B", parties: "EV Materials Inc / Chilean Gov", status: "completed", featured: true, region: "South America", sustainability: 73 },
    { id: 3, dealName: "North Sea Wind Farm Rights", resource: "Wind Energy", value: "$4.5B", parties: "Nordic Energy / UK Crown Estate", status: "pending", featured: false, region: "Europe", sustainability: 88 }
  ])

  const [snapshotMetrics, setSnapshotMetrics] = useState<SnapshotMetric[]>([
    { id: 1, label: "GLOBAL CARBON MARKET", value: "$909B", change: "+15.3%", isPositive: true, isActive: true, category: "Carbon" },
    { id: 2, label: "WATER FUTURES INDEX", value: "2,847", change: "+8.7%", isPositive: true, isActive: true, category: "Water" },
    { id: 3, label: "RARE EARTH PRICES", value: "$34,200/T", change: "-3.2%", isPositive: false, isActive: true, category: "Minerals" },
    { id: 4, label: "RENEWABLE CAPACITY", value: "3.4TW", change: "+22.1%", isPositive: true, isActive: true, category: "Energy" },
    { id: 5, label: "FOREST CARBON CREDITS", value: "$127/TCO2", change: "+18.9%", isPositive: true, isActive: true, category: "Carbon" },
    { id: 6, label: "CRITICAL MINERAL RESERVES", value: "47.2M MT", change: "-5.1%", isPositive: false, isActive: true, category: "Minerals" }
  ])

  const [activeTab, setActiveTab] = useState("overview")
  const [showReportForm, setShowReportForm] = useState(false)
  const [showEventForm, setShowEventForm] = useState(false)
  const [showDealForm, setShowDealForm] = useState(false)
  const [showMetricForm, setShowMetricForm] = useState(false)

  const handleCreateReport = (data: any) => {
    const newReport: AnalysisReport = {
      id: analysisReports.length + 1,
      title: data.title,
      category: data.category,
      author: data.author,
      status: data.status,
      featured: data.featured,
      createdAt: new Date().toISOString().split('T')[0],
      views: 0,
      resourceType: data.resourceType
    }
    setAnalysisReports([...analysisReports, newReport])
    setShowReportForm(false)
    toast({ title: "Analysis report created successfully" })
  }

  const handleCreateEvent = (data: any) => {
    const newEvent: ResourceEvent = {
      id: resourceEvents.length + 1,
      title: data.title,
      type: data.type,
      date: data.date,
      location: data.location,
      capacity: data.capacity,
      registered: 0,
      status: data.status,
      featured: data.featured,
      resourceFocus: data.resourceFocus
    }
    setResourceEvents([...resourceEvents, newEvent])
    setShowEventForm(false)
    toast({ title: "Resource event created successfully" })
  }

  const handleCreateDeal = (data: any) => {
    const newDeal: KeyDeal = {
      id: keyDeals.length + 1,
      dealName: data.dealName,
      resource: data.resource,
      value: data.value,
      parties: data.parties,
      status: data.status,
      featured: data.featured,
      region: data.region,
      sustainability: data.sustainability
    }
    setKeyDeals([...keyDeals, newDeal])
    setShowDealForm(false)
    toast({ title: "Key deal created successfully" })
  }

  const handleCreateMetric = (data: any) => {
    const newMetric: SnapshotMetric = {
      id: snapshotMetrics.length + 1,
      label: data.label.toUpperCase(),
      value: data.value,
      change: data.change,
      isPositive: parseFloat(data.change.replace(/[^-\d.]/g, '')) >= 0,
      isActive: data.isActive,
      category: data.category
    }
    setSnapshotMetrics([...snapshotMetrics, newMetric])
    setShowMetricForm(false)
    toast({ title: "Snapshot metric created successfully" })
  }

  const toggleReportFeatured = (id: number) => {
    setAnalysisReports(analysisReports.map(report => 
      report.id === id ? { ...report, featured: !report.featured } : report
    ))
  }

  const toggleEventFeatured = (id: number) => {
    setResourceEvents(resourceEvents.map(event => 
      event.id === id ? { ...event, featured: !event.featured } : event
    ))
  }

  const toggleDealFeatured = (id: number) => {
    setKeyDeals(keyDeals.map(deal => 
      deal.id === id ? { ...deal, featured: !deal.featured } : deal
    ))
  }

  const toggleMetricActive = (id: number) => {
    setSnapshotMetrics(snapshotMetrics.map(metric => 
      metric.id === id ? { ...metric, isActive: !metric.isActive } : metric
    ))
  }

  const deleteReport = (id: number) => {
    setAnalysisReports(analysisReports.filter(report => report.id !== id))
    toast({ title: "Analysis report deleted successfully" })
  }

  const deleteEvent = (id: number) => {
    setResourceEvents(resourceEvents.filter(event => event.id !== id))
    toast({ title: "Resource event deleted successfully" })
  }

  const deleteDeal = (id: number) => {
    setKeyDeals(keyDeals.filter(deal => deal.id !== id))
    toast({ title: "Key deal deleted successfully" })
  }

  const deleteMetric = (id: number) => {
    setSnapshotMetrics(snapshotMetrics.filter(metric => metric.id !== id))
    toast({ title: "Snapshot metric deleted successfully" })
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <div className="border-b bg-gradient-to-r from-natural-blue via-natural-teal to-natural-green">
        <div className="max-w-7xl mx-auto px-6 lg:px-8 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-white">Natural Currency Admin</h1>
              <p className="text-white/80 mt-1">Manage natural resource platform content and data</p>
            </div>
            <div className="flex gap-3">
              <Button variant="secondary" onClick={() => setShowReportForm(true)}>
                <Plus className="w-4 h-4 mr-2" />
                New Analysis
              </Button>
              <Button variant="secondary" onClick={() => setShowEventForm(true)}>
                <Plus className="w-4 h-4 mr-2" />
                New Event
              </Button>
              <Button variant="secondary" onClick={() => setShowDealForm(true)}>
                <Plus className="w-4 h-4 mr-2" />
                New Deal
              </Button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-6 lg:px-8 py-8">
        <Tabs value={activeTab} onValueChange={setActiveTab}>
          <TabsList className="grid w-full grid-cols-6">
            <TabsTrigger value="overview" className="flex items-center gap-2">
              <TrendingUp className="w-4 h-4" />
              Overview
            </TabsTrigger>
            <TabsTrigger value="analysis" className="flex items-center gap-2">
              <FileText className="w-4 h-4" />
              Analysis
            </TabsTrigger>
            <TabsTrigger value="events" className="flex items-center gap-2">
              <Calendar className="w-4 h-4" />
              Events
            </TabsTrigger>
            <TabsTrigger value="deals" className="flex items-center gap-2">
              <Globe className="w-4 h-4" />
              Key Deals
            </TabsTrigger>
            <TabsTrigger value="snapshot" className="flex items-center gap-2">
              <BarChart3 className="w-4 h-4" />
              Snapshot
            </TabsTrigger>
            <TabsTrigger value="settings" className="flex items-center gap-2">
              <Settings className="w-4 h-4" />
              Settings
            </TabsTrigger>
          </TabsList>

          {/* Overview Tab */}
          <TabsContent value="overview" className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Analysis Reports</CardTitle>
                  <FileText className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{analysisReports.length}</div>
                  <p className="text-xs text-muted-foreground">
                    {analysisReports.filter(r => r.status === 'published').length} published
                  </p>
                </CardContent>
              </Card>
              
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Resource Events</CardTitle>
                  <CalendarIcon className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{resourceEvents.length}</div>
                  <p className="text-xs text-muted-foreground">
                    {resourceEvents.filter(e => e.status === 'published').length} published
                  </p>
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Active Deals</CardTitle>
                  <Globe className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{keyDeals.filter(d => d.status === 'active').length}</div>
                  <p className="text-xs text-muted-foreground">
                    {keyDeals.length} total deals
                  </p>
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Sustainability Score</CardTitle>
                  <Leaf className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">
                    {Math.round(keyDeals.reduce((sum, deal) => sum + deal.sustainability, 0) / keyDeals.length)}%
                  </div>
                  <p className="text-xs text-muted-foreground">Average across deals</p>
                </CardContent>
              </Card>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              <Card>
                <CardHeader>
                  <CardTitle>Recent Analysis Reports</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3">
                    {analysisReports.slice(0, 5).map(report => (
                      <div key={report.id} className="flex items-center justify-between">
                        <div>
                          <p className="font-medium">{report.title}</p>
                          <p className="text-sm text-muted-foreground">{report.author} • {report.views} views</p>
                        </div>
                        <Badge variant={report.status === 'published' ? 'default' : 'secondary'}>
                          {report.status}
                        </Badge>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader>
                  <CardTitle>Key Resource Deals</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3">
                    {keyDeals.slice(0, 5).map(deal => (
                      <div key={deal.id} className="flex items-center justify-between">
                        <div>
                          <p className="font-medium">{deal.dealName}</p>
                          <p className="text-sm text-muted-foreground">{deal.resource} • {deal.value}</p>
                        </div>
                        <Badge variant={deal.status === 'active' ? 'default' : deal.status === 'completed' ? 'secondary' : 'outline'}>
                          {deal.status}
                        </Badge>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>
            </div>
          </TabsContent>

          {/* Analysis Reports Tab */}
          <TabsContent value="analysis" className="space-y-6">
            {!showReportForm ? (
              <Card>
                <CardHeader>
                  <CardTitle>Analysis Reports Management</CardTitle>
                  <CardDescription>Manage natural resource analysis reports and research</CardDescription>
                </CardHeader>
                <CardContent>
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead>Title</TableHead>
                        <TableHead>Resource Type</TableHead>
                        <TableHead>Author</TableHead>
                        <TableHead>Status</TableHead>
                        <TableHead>Featured</TableHead>
                        <TableHead>Views</TableHead>
                        <TableHead>Actions</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {analysisReports.map(report => (
                        <TableRow key={report.id}>
                          <TableCell className="font-medium">{report.title}</TableCell>
                          <TableCell>{report.resourceType}</TableCell>
                          <TableCell>{report.author}</TableCell>
                          <TableCell>
                            <Badge variant={report.status === 'published' ? 'default' : 'secondary'}>
                              {report.status}
                            </Badge>
                          </TableCell>
                          <TableCell>
                            <Switch 
                              checked={report.featured} 
                              onCheckedChange={() => toggleReportFeatured(report.id)}
                            />
                          </TableCell>
                          <TableCell>{report.views}</TableCell>
                          <TableCell>
                            <div className="flex gap-2">
                              <Button variant="ghost" size="sm">
                                <Edit className="w-4 h-4" />
                              </Button>
                              <Button variant="ghost" size="sm" onClick={() => deleteReport(report.id)}>
                                <Trash2 className="w-4 h-4" />
                              </Button>
                            </div>
                          </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </CardContent>
              </Card>
            ) : (
              <ReportForm onSubmit={handleCreateReport} onCancel={() => setShowReportForm(false)} />
            )}
          </TabsContent>

          {/* Events Management Tab */}
          <TabsContent value="events" className="space-y-6">
            {!showEventForm ? (
              <Card>
                <CardHeader>
                  <CardTitle>Resource Events Management</CardTitle>
                  <CardDescription>Manage natural resource conferences, workshops, and forums</CardDescription>
                </CardHeader>
                <CardContent>
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead>Title</TableHead>
                        <TableHead>Resource Focus</TableHead>
                        <TableHead>Date</TableHead>
                        <TableHead>Location</TableHead>
                        <TableHead>Capacity</TableHead>
                        <TableHead>Featured</TableHead>
                        <TableHead>Actions</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {resourceEvents.map(event => (
                        <TableRow key={event.id}>
                          <TableCell className="font-medium">{event.title}</TableCell>
                          <TableCell>{event.resourceFocus}</TableCell>
                          <TableCell>{event.date}</TableCell>
                          <TableCell>{event.location}</TableCell>
                          <TableCell>{event.registered}/{event.capacity}</TableCell>
                          <TableCell>
                            <Switch 
                              checked={event.featured} 
                              onCheckedChange={() => toggleEventFeatured(event.id)}
                            />
                          </TableCell>
                          <TableCell>
                            <div className="flex gap-2">
                              <Button variant="ghost" size="sm">
                                <Edit className="w-4 h-4" />
                              </Button>
                              <Button variant="ghost" size="sm" onClick={() => deleteEvent(event.id)}>
                                <Trash2 className="w-4 h-4" />
                              </Button>
                            </div>
                          </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </CardContent>
              </Card>
            ) : (
              <EventForm onSubmit={handleCreateEvent} onCancel={() => setShowEventForm(false)} />
            )}
          </TabsContent>

          {/* Key Deals Tab */}
          <TabsContent value="deals" className="space-y-6">
            {!showDealForm ? (
              <Card>
                <CardHeader>
                  <CardTitle>Key Deals Management</CardTitle>
                  <CardDescription>Manage major natural resource transactions and deals</CardDescription>
                </CardHeader>
                <CardContent>
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead>Deal Name</TableHead>
                        <TableHead>Resource</TableHead>
                        <TableHead>Value</TableHead>
                        <TableHead>Region</TableHead>
                        <TableHead>Sustainability</TableHead>
                        <TableHead>Status</TableHead>
                        <TableHead>Featured</TableHead>
                        <TableHead>Actions</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {keyDeals.map(deal => (
                        <TableRow key={deal.id}>
                          <TableCell className="font-medium">{deal.dealName}</TableCell>
                          <TableCell>{deal.resource}</TableCell>
                          <TableCell>{deal.value}</TableCell>
                          <TableCell>{deal.region}</TableCell>
                          <TableCell>
                            <Badge variant={deal.sustainability >= 80 ? 'default' : deal.sustainability >= 60 ? 'secondary' : 'destructive'}>
                              {deal.sustainability}%
                            </Badge>
                          </TableCell>
                          <TableCell>
                            <Badge variant={deal.status === 'active' ? 'default' : deal.status === 'completed' ? 'secondary' : 'outline'}>
                              {deal.status}
                            </Badge>
                          </TableCell>
                          <TableCell>
                            <Switch 
                              checked={deal.featured} 
                              onCheckedChange={() => toggleDealFeatured(deal.id)}
                            />
                          </TableCell>
                          <TableCell>
                            <div className="flex gap-2">
                              <Button variant="ghost" size="sm">
                                <Edit className="w-4 h-4" />
                              </Button>
                              <Button variant="ghost" size="sm" onClick={() => deleteDeal(deal.id)}>
                                <Trash2 className="w-4 h-4" />
                              </Button>
                            </div>
                          </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </CardContent>
              </Card>
            ) : (
              <DealForm onSubmit={handleCreateDeal} onCancel={() => setShowDealForm(false)} />
            )}
          </TabsContent>

          {/* Snapshot Metrics Tab */}
          <TabsContent value="snapshot" className="space-y-6">
            {!showMetricForm ? (
              <Card>
                <CardHeader>
                  <CardTitle>Snapshot Metrics Management</CardTitle>
                  <CardDescription>Manage real-time natural resource market indicators</CardDescription>
                </CardHeader>
                <CardContent>
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead>Metric Label</TableHead>
                        <TableHead>Category</TableHead>
                        <TableHead>Value</TableHead>
                        <TableHead>Change</TableHead>
                        <TableHead>Active</TableHead>
                        <TableHead>Actions</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {snapshotMetrics.map(metric => (
                        <TableRow key={metric.id}>
                          <TableCell className="font-medium">{metric.label}</TableCell>
                          <TableCell>{metric.category}</TableCell>
                          <TableCell>{metric.value}</TableCell>
                          <TableCell>
                            <Badge variant={metric.isPositive ? 'default' : 'destructive'}>
                              {metric.change}
                            </Badge>
                          </TableCell>
                          <TableCell>
                            <Switch 
                              checked={metric.isActive} 
                              onCheckedChange={() => toggleMetricActive(metric.id)}
                            />
                          </TableCell>
                          <TableCell>
                            <div className="flex gap-2">
                              <Button variant="ghost" size="sm">
                                <Edit className="w-4 h-4" />
                              </Button>
                              <Button variant="ghost" size="sm" onClick={() => deleteMetric(metric.id)}>
                                <Trash2 className="w-4 h-4" />
                              </Button>
                            </div>
                          </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </CardContent>
              </Card>
            ) : (
              <MetricForm onSubmit={handleCreateMetric} onCancel={() => setShowMetricForm(false)} />
            )}
          </TabsContent>

          {/* Settings Tab */}
          <TabsContent value="settings" className="space-y-6">
            <Card>
              <CardHeader>
                <CardTitle>Platform Settings</CardTitle>
                <CardDescription>Configure Natural Currency platform settings</CardDescription>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="flex items-center justify-between">
                  <div>
                    <Label htmlFor="maintenance">Maintenance Mode</Label>
                    <p className="text-sm text-muted-foreground">Enable maintenance mode for platform updates</p>
                  </div>
                  <Switch id="maintenance" />
                </div>
                <div className="flex items-center justify-between">
                  <div>
                    <Label htmlFor="notifications">Event Notifications</Label>
                    <p className="text-sm text-muted-foreground">Send notifications for new resource events</p>
                  </div>
                  <Switch id="notifications" defaultChecked />
                </div>
                <div className="flex items-center justify-between">
                  <div>
                    <Label htmlFor="analytics">Analytics Tracking</Label>
                    <p className="text-sm text-muted-foreground">Enable detailed platform analytics</p>
                  </div>
                  <Switch id="analytics" defaultChecked />
                </div>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </div>
    </div>
  )
}

// Form Components
function ReportForm({ onSubmit, onCancel }: { onSubmit: (data: any) => void, onCancel: () => void }) {
  const [formData, setFormData] = useState({
    title: '',
    category: '',
    author: '',
    status: 'draft',
    featured: false,
    resourceType: ''
  })

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    onSubmit(formData)
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Create Analysis Report</CardTitle>
        <CardDescription>Add a new natural resource analysis report</CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <Label htmlFor="title">Report Title</Label>
            <Input
              id="title"
              value={formData.title}
              onChange={(e) => setFormData({...formData, title: e.target.value})}
              required
            />
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <Label htmlFor="category">Category</Label>
              <Select value={formData.category} onValueChange={(value) => setFormData({...formData, category: value})}>
                <SelectTrigger>
                  <SelectValue placeholder="Select category" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="Water Resources">Water Resources</SelectItem>
                  <SelectItem value="Mining">Mining</SelectItem>
                  <SelectItem value="Carbon Trading">Carbon Trading</SelectItem>
                  <SelectItem value="Renewable Energy">Renewable Energy</SelectItem>
                  <SelectItem value="Forestry">Forestry</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label htmlFor="resourceType">Resource Type</Label>
              <Select value={formData.resourceType} onValueChange={(value) => setFormData({...formData, resourceType: value})}>
                <SelectTrigger>
                  <SelectValue placeholder="Select resource" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="Water">Water</SelectItem>
                  <SelectItem value="Minerals">Minerals</SelectItem>
                  <SelectItem value="Carbon">Carbon</SelectItem>
                  <SelectItem value="Energy">Energy</SelectItem>
                  <SelectItem value="Timber">Timber</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
          <div>
            <Label htmlFor="author">Author</Label>
            <Input
              id="author"
              value={formData.author}
              onChange={(e) => setFormData({...formData, author: e.target.value})}
              required
            />
          </div>
          <div className="flex items-center space-x-2">
            <Switch 
              checked={formData.featured} 
              onCheckedChange={(checked) => setFormData({...formData, featured: checked})}
            />
            <Label>Featured Report</Label>
          </div>
          <div className="flex gap-3">
            <Button type="submit">Create Report</Button>
            <Button type="button" variant="outline" onClick={onCancel}>Cancel</Button>
          </div>
        </form>
      </CardContent>
    </Card>
  )
}

function EventForm({ onSubmit, onCancel }: { onSubmit: (data: any) => void, onCancel: () => void }) {
  const [formData, setFormData] = useState({
    title: '',
    type: '',
    date: '',
    location: '',
    capacity: '',
    resourceFocus: '',
    featured: false
  })

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    onSubmit({...formData, capacity: parseInt(formData.capacity)})
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Create Resource Event</CardTitle>
        <CardDescription>Add a new natural resource event</CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <Label htmlFor="title">Event Title</Label>
            <Input
              id="title"
              value={formData.title}
              onChange={(e) => setFormData({...formData, title: e.target.value})}
              required
            />
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <Label htmlFor="type">Event Type</Label>
              <Select value={formData.type} onValueChange={(value) => setFormData({...formData, type: value})}>
                <SelectTrigger>
                  <SelectValue placeholder="Select type" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="Conference">Conference</SelectItem>
                  <SelectItem value="Workshop">Workshop</SelectItem>
                  <SelectItem value="Panel">Panel</SelectItem>
                  <SelectItem value="Summit">Summit</SelectItem>
                  <SelectItem value="Forum">Forum</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label htmlFor="resourceFocus">Resource Focus</Label>
              <Select value={formData.resourceFocus} onValueChange={(value) => setFormData({...formData, resourceFocus: value})}>
                <SelectTrigger>
                  <SelectValue placeholder="Select focus" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="Carbon Trading">Carbon Trading</SelectItem>
                  <SelectItem value="Water">Water</SelectItem>
                  <SelectItem value="Mining">Mining</SelectItem>
                  <SelectItem value="Renewable Energy">Renewable Energy</SelectItem>
                  <SelectItem value="Forestry">Forestry</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
          <div className="grid grid-cols-3 gap-4">
            <div>
              <Label htmlFor="date">Date</Label>
              <Input
                id="date"
                type="date"
                value={formData.date}
                onChange={(e) => setFormData({...formData, date: e.target.value})}
                required
              />
            </div>
            <div>
              <Label htmlFor="location">Location</Label>
              <Input
                id="location"
                value={formData.location}
                onChange={(e) => setFormData({...formData, location: e.target.value})}
                required
              />
            </div>
            <div>
              <Label htmlFor="capacity">Capacity</Label>
              <Input
                id="capacity"
                type="number"
                value={formData.capacity}
                onChange={(e) => setFormData({...formData, capacity: e.target.value})}
                required
              />
            </div>
          </div>
          <div className="flex items-center space-x-2">
            <Switch 
              checked={formData.featured} 
              onCheckedChange={(checked) => setFormData({...formData, featured: checked})}
            />
            <Label>Featured Event</Label>
          </div>
          <div className="flex gap-3">
            <Button type="submit">Create Event</Button>
            <Button type="button" variant="outline" onClick={onCancel}>Cancel</Button>
          </div>
        </form>
      </CardContent>
    </Card>
  )
}

function DealForm({ onSubmit, onCancel }: { onSubmit: (data: any) => void, onCancel: () => void }) {
  const [formData, setFormData] = useState({
    dealName: '',
    resource: '',
    value: '',
    parties: '',
    status: 'active',
    region: '',
    sustainability: '',
    featured: false
  })

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    onSubmit({...formData, sustainability: parseInt(formData.sustainability)})
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Create Key Deal</CardTitle>
        <CardDescription>Add a new major natural resource transaction</CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <Label htmlFor="dealName">Deal Name</Label>
            <Input
              id="dealName"
              value={formData.dealName}
              onChange={(e) => setFormData({...formData, dealName: e.target.value})}
              required
            />
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <Label htmlFor="resource">Resource Type</Label>
              <Input
                id="resource"
                value={formData.resource}
                onChange={(e) => setFormData({...formData, resource: e.target.value})}
                required
              />
            </div>
            <div>
              <Label htmlFor="value">Deal Value</Label>
              <Input
                id="value"
                value={formData.value}
                onChange={(e) => setFormData({...formData, value: e.target.value})}
                required
              />
            </div>
          </div>
          <div>
            <Label htmlFor="parties">Parties Involved</Label>
            <Input
              id="parties"
              value={formData.parties}
              onChange={(e) => setFormData({...formData, parties: e.target.value})}
              required
            />
          </div>
          <div className="grid grid-cols-3 gap-4">
            <div>
              <Label htmlFor="region">Region</Label>
              <Select value={formData.region} onValueChange={(value) => setFormData({...formData, region: value})}>
                <SelectTrigger>
                  <SelectValue placeholder="Select region" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="North America">North America</SelectItem>
                  <SelectItem value="South America">South America</SelectItem>
                  <SelectItem value="Europe">Europe</SelectItem>
                  <SelectItem value="Asia Pacific">Asia Pacific</SelectItem>
                  <SelectItem value="Africa">Africa</SelectItem>
                  <SelectItem value="Middle East">Middle East</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label htmlFor="status">Status</Label>
              <Select value={formData.status} onValueChange={(value) => setFormData({...formData, status: value})}>
                <SelectTrigger>
                  <SelectValue placeholder="Select status" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="active">Active</SelectItem>
                  <SelectItem value="completed">Completed</SelectItem>
                  <SelectItem value="pending">Pending</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label htmlFor="sustainability">Sustainability Score (%)</Label>
              <Input
                id="sustainability"
                type="number"
                min="0"
                max="100"
                value={formData.sustainability}
                onChange={(e) => setFormData({...formData, sustainability: e.target.value})}
                required
              />
            </div>
          </div>
          <div className="flex items-center space-x-2">
            <Switch 
              checked={formData.featured} 
              onCheckedChange={(checked) => setFormData({...formData, featured: checked})}
            />
            <Label>Featured Deal</Label>
          </div>
          <div className="flex gap-3">
            <Button type="submit">Create Deal</Button>
            <Button type="button" variant="outline" onClick={onCancel}>Cancel</Button>
          </div>
        </form>
      </CardContent>
    </Card>
  )
}

function MetricForm({ onSubmit, onCancel }: { onSubmit: (data: any) => void, onCancel: () => void }) {
  const [formData, setFormData] = useState({
    label: '',
    value: '',
    change: '',
    category: '',
    isActive: true
  })

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    onSubmit(formData)
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Create Snapshot Metric</CardTitle>
        <CardDescription>Add a new real-time market indicator</CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <Label htmlFor="label">Metric Label</Label>
            <Input
              id="label"
              value={formData.label}
              onChange={(e) => setFormData({...formData, label: e.target.value})}
              required
            />
          </div>
          <div className="grid grid-cols-3 gap-4">
            <div>
              <Label htmlFor="value">Value</Label>
              <Input
                id="value"
                value={formData.value}
                onChange={(e) => setFormData({...formData, value: e.target.value})}
                required
              />
            </div>
            <div>
              <Label htmlFor="change">Change (%)</Label>
              <Input
                id="change"
                value={formData.change}
                onChange={(e) => setFormData({...formData, change: e.target.value})}
                placeholder="+5.2%"
                required
              />
            </div>
            <div>
              <Label htmlFor="category">Category</Label>
              <Select value={formData.category} onValueChange={(value) => setFormData({...formData, category: value})}>
                <SelectTrigger>
                  <SelectValue placeholder="Select category" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="Carbon">Carbon</SelectItem>
                  <SelectItem value="Water">Water</SelectItem>
                  <SelectItem value="Minerals">Minerals</SelectItem>
                  <SelectItem value="Energy">Energy</SelectItem>
                  <SelectItem value="Forestry">Forestry</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
          <div className="flex items-center space-x-2">
            <Switch 
              checked={formData.isActive} 
              onCheckedChange={(checked) => setFormData({...formData, isActive: checked})}
            />
            <Label>Active Metric</Label>
          </div>
          <div className="flex gap-3">
            <Button type="submit">Create Metric</Button>
            <Button type="button" variant="outline" onClick={onCancel}>Cancel</Button>
          </div>
        </form>
      </CardContent>
    </Card>
  )
}