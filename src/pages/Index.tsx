import { Navigation } from "@/components/Navigation"
import { HeroSection } from "@/components/HeroSection"
import { PrivateEquityAIChat } from "@/components/ui/v0-ai-chat"
import { StatsSection } from "@/components/StatsSection"
import { FeaturesSection } from "@/components/FeaturesSection"
import { TestimonialSection } from "@/components/TestimonialSection"
import { PricingSection } from "@/components/PricingSection"
import { Footer } from "@/components/Footer"

const Index = () => {
  return (
    <div className="min-h-screen font-primary bg-background">
      <Navigation />
      <HeroSection />
      
      {/* Natural Resource AI Assistant */}
      <section className="py-20 bg-gradient-card">
        <PrivateEquityAIChat />
      </section>
      <StatsSection />
      <FeaturesSection />
      <TestimonialSection />
      <PricingSection />
      <Footer />
    </div>
  );
};

export default Index;
