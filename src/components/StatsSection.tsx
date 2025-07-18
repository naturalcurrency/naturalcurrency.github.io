import { useEffect, useState } from "react"

interface StatItemProps {
  value: string
  label: string
  prefix?: string
  suffix?: string
  delay?: number
}

function StatItem({ value, label, prefix = "", suffix = "", delay = 0 }: StatItemProps) {
  const [currentValue, setCurrentValue] = useState(0)
  const numericValue = parseInt(value.replace(/[^\d]/g, ''))
  
  useEffect(() => {
    const timer = setTimeout(() => {
      let start = 0
      const duration = 2000
      const increment = numericValue / (duration / 16)
      
      const counter = setInterval(() => {
        start += increment
        if (start >= numericValue) {
          setCurrentValue(numericValue)
          clearInterval(counter)
        } else {
          setCurrentValue(Math.floor(start))
        }
      }, 16)
      
      return () => clearInterval(counter)
    }, delay)
    
    return () => clearTimeout(timer)
  }, [numericValue, delay])
  
  const formatValue = (val: number) => {
    if (val >= 1000) {
      return `${prefix}${(val / 1000).toFixed(1)}K${suffix}`
    }
    return `${prefix}${val}${suffix}`
  }
  
  return (
    <div className="text-center">
      <div className="text-4xl md:text-5xl font-bold text-foreground mb-2">
        {numericValue >= 1000 ? formatValue(currentValue) : `${prefix}${currentValue}${suffix}`}
      </div>
      <div className="text-foreground/70 font-medium">{label}</div>
    </div>
  )
}

export function StatsSection() {
  return (
    <section className="py-20 bg-gradient-hero relative overflow-hidden">
      {/* Natural landscape background */}
      <div className="absolute inset-0 opacity-30">
        <svg viewBox="0 0 1200 400" className="absolute inset-0 w-full h-full">
          <path 
            d="M0,250 C200,150 400,300 600,180 C800,220 1000,120 1200,200 L1200,400 L0,400 Z" 
            fill="url(#resourcesWave)"
          />
          <defs>
            <linearGradient id="resourcesWave" x1="0%" y1="0%" x2="100%" y2="0%">
              <stop offset="0%" stopColor="hsl(140 40% 30%)" stopOpacity="0.4" />
              <stop offset="50%" stopColor="hsl(195 60% 50%)" stopOpacity="0.3" />
              <stop offset="100%" stopColor="hsl(25 35% 25%)" stopOpacity="0.2" />
            </linearGradient>
          </defs>
        </svg>
      </div>
      
      <div className="relative max-w-7xl mx-auto px-6 lg:px-8">
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-8 lg:gap-16">
          <StatItem 
            value="1200" 
            label="Billion in Natural Assets"
            prefix="$"
            suffix="B+"
            delay={0}
          />
          <StatItem 
            value="5000" 
            label="Resource Transactions"
            suffix="+"
            delay={200}
          />
          <StatItem 
            value="150" 
            label="Countries Tracked"
            suffix="+"
            delay={400}
          />
          <StatItem 
            value="98" 
            label="Sustainability Score"
            suffix="%"
            delay={600}
          />
        </div>
      </div>
    </section>
  )
}