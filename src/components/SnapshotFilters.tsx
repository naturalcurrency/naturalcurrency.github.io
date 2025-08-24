import { useState, useEffect } from "react"
import { supabase } from "@/integrations/supabase/client"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { X } from "lucide-react"

interface FilterOptions {
  regions: { id: string; name: string; slug: string }[]
  countries: { id: string; name: string; slug: string; region_id: string }[]
  cities: { id: string; name: string; slug: string; country_id: string }[]
  sectors: { id: string; name: string; slug: string }[]
  subSectors: { id: string; name: string; slug: string; sector_id: string }[]
}

interface SnapshotFiltersProps {
  onFiltersChange: (filters: {
    regionId?: string
    countryId?: string
    cityId?: string
    sectorId?: string
    subSectorId?: string
  }) => void
}

export function SnapshotFilters({ onFiltersChange }: SnapshotFiltersProps) {
  const [filterOptions, setFilterOptions] = useState<FilterOptions>({
    regions: [],
    countries: [],
    cities: [],
    sectors: [],
    subSectors: []
  })
  
  const [selectedFilters, setSelectedFilters] = useState({
    regionId: 'all',
    countryId: 'all',
    cityId: 'all',
    sectorId: 'all',
    subSectorId: 'all'
  })

  const [filteredOptions, setFilteredOptions] = useState({
    countries: [] as typeof filterOptions.countries,
    cities: [] as typeof filterOptions.cities,
    subSectors: [] as typeof filterOptions.subSectors
  })

  useEffect(() => {
    fetchFilterOptions()
  }, [])

  useEffect(() => {
    // Update filtered countries when region changes
    const countries = selectedFilters.regionId && selectedFilters.regionId !== 'all'
      ? filterOptions.countries.filter(c => c.region_id === selectedFilters.regionId)
      : filterOptions.countries

    // Update filtered cities when country changes
    const cities = selectedFilters.countryId && selectedFilters.countryId !== 'all'
      ? filterOptions.cities.filter(c => c.country_id === selectedFilters.countryId)
      : filterOptions.cities

    // Update filtered sub-sectors when sector changes
    const subSectors = selectedFilters.sectorId && selectedFilters.sectorId !== 'all'
      ? filterOptions.subSectors.filter(s => s.sector_id === selectedFilters.sectorId)
      : filterOptions.subSectors

    setFilteredOptions({ countries, cities, subSectors })
  }, [selectedFilters.regionId, selectedFilters.countryId, selectedFilters.sectorId, filterOptions])

  const fetchFilterOptions = async () => {
    try {
      const [regionsRes, countriesRes, citiesRes, sectorsRes, subSectorsRes] = await Promise.all([
        supabase.from('snapshot_geographic_regions').select('id, name, slug').order('name'),
        supabase.from('snapshot_countries').select('id, name, slug, region_id').order('name'),
        supabase.from('snapshot_cities').select('id, name, slug, country_id').order('name'),
        supabase.from('snapshot_sectors').select('id, name, slug').order('name'),
        supabase.from('snapshot_sub_sectors').select('id, name, slug, sector_id').order('name')
      ])

      if (regionsRes.error) throw regionsRes.error
      if (countriesRes.error) throw countriesRes.error
      if (citiesRes.error) throw citiesRes.error
      if (sectorsRes.error) throw sectorsRes.error
      if (subSectorsRes.error) throw subSectorsRes.error

      setFilterOptions({
        regions: regionsRes.data || [],
        countries: countriesRes.data || [],
        cities: citiesRes.data || [],
        sectors: sectorsRes.data || [],
        subSectors: subSectorsRes.data || []
      })
    } catch (error) {
      console.error('Error fetching filter options:', error)
    }
  }

  const handleFilterChange = (filterType: string, value: string) => {
    const newFilters = { ...selectedFilters, [filterType]: value }
    
    // Clear dependent filters when parent changes
    if (filterType === 'regionId') {
      newFilters.countryId = 'all'
      newFilters.cityId = 'all'
    }
    if (filterType === 'countryId') {
      newFilters.cityId = 'all'
    }
    if (filterType === 'sectorId') {
      newFilters.subSectorId = 'all'
    }
    
    setSelectedFilters(newFilters)
    
    // Only send non-empty filters
    const activeFilters = Object.fromEntries(
      Object.entries(newFilters).filter(([_, value]) => value !== '' && value !== 'all')
    )
    
    onFiltersChange(activeFilters)
  }

  const clearAllFilters = () => {
    const clearedFilters = {
      regionId: 'all',
      countryId: 'all',
      cityId: 'all',
      sectorId: 'all',
      subSectorId: 'all'
    }
    setSelectedFilters(clearedFilters)
    onFiltersChange({})
  }

  const hasActiveFilters = Object.values(selectedFilters).some(value => value !== '' && value !== 'all')

  return (
    <Card className="bg-gradient-card border-white/10 mb-8">
      <CardHeader>
        <div className="flex items-center justify-between">
          <CardTitle className="text-white">Market Filters</CardTitle>
          {hasActiveFilters && (
            <Button
              variant="ghost"
              size="sm"
              onClick={clearAllFilters}
              className="text-white/70 hover:text-white"
            >
              <X className="h-4 w-4 mr-2" />
              Clear All
            </Button>
          )}
        </div>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-5 gap-4">
          <div>
            <label className="text-sm font-medium text-white/80 mb-2 block">Region</label>
            <Select 
              value={selectedFilters.regionId} 
              onValueChange={(value) => handleFilterChange('regionId', value)}
            >
              <SelectTrigger className="bg-white/5 border-white/20 text-white">
                <SelectValue placeholder="All Regions" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All Regions</SelectItem>
                {filterOptions.regions.map((region) => (
                  <SelectItem key={region.id} value={region.id}>
                    {region.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <div>
            <label className="text-sm font-medium text-white/80 mb-2 block">Country</label>
            <Select 
              value={selectedFilters.countryId}
              onValueChange={(value) => handleFilterChange('countryId', value)}
              disabled={selectedFilters.regionId === 'all' && filteredOptions.countries.length === 0}
            >
              <SelectTrigger className="bg-white/5 border-white/20 text-white">
                <SelectValue placeholder="All Countries" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All Countries</SelectItem>
                {filteredOptions.countries.map((country) => (
                  <SelectItem key={country.id} value={country.id}>
                    {country.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <div>
            <label className="text-sm font-medium text-white/80 mb-2 block">State/Province</label>
            <Select 
              value={selectedFilters.cityId}
              onValueChange={(value) => handleFilterChange('cityId', value)}
              disabled={selectedFilters.countryId === 'all' && filteredOptions.cities.length === 0}
            >
              <SelectTrigger className="bg-white/5 border-white/20 text-white">
                <SelectValue placeholder="All States" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All States</SelectItem>
                {filteredOptions.cities.map((city) => (
                  <SelectItem key={city.id} value={city.id}>
                    {city.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <div>
            <label className="text-sm font-medium text-white/80 mb-2 block">Sector</label>
            <Select 
              value={selectedFilters.sectorId}
              onValueChange={(value) => handleFilterChange('sectorId', value)}
            >
              <SelectTrigger className="bg-white/5 border-white/20 text-white">
                <SelectValue placeholder="All Sectors" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All Sectors</SelectItem>
                {filterOptions.sectors.map((sector) => (
                  <SelectItem key={sector.id} value={sector.id}>
                    {sector.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <div>
            <label className="text-sm font-medium text-white/80 mb-2 block">Sub-sector</label>
            <Select 
              value={selectedFilters.subSectorId}
              onValueChange={(value) => handleFilterChange('subSectorId', value)}
              disabled={selectedFilters.sectorId === 'all' && filteredOptions.subSectors.length === 0}
            >
              <SelectTrigger className="bg-white/5 border-white/20 text-white">
                <SelectValue placeholder="All Sub-sectors" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All Sub-sectors</SelectItem>
                {filteredOptions.subSectors.map((subSector) => (
                  <SelectItem key={subSector.id} value={subSector.id}>
                    {subSector.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}