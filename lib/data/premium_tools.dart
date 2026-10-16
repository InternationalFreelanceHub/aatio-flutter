class PremiumTool {
  final String name;
  final String description;
  final String url;

  const PremiumTool({
    required this.name,
    required this.description,
    required this.url,
  });
}

const List<PremiumTool> premiumTools = [
  PremiumTool(
    name: 'Tactiq',
    description: 'Still typing meeting notes? Let AI do it for you. Auto Meeting Transcripts from Google Meet & Zoom',
    url: 'https://tactiq.io',
  ),
  PremiumTool(
    name: 'Gamma App',
    description: 'Turns plain text into stunning slides automatically. AI Presentation Builder.',
    url: 'https://gamma.app',
  ),
  PremiumTool(
    name: 'Murf.ai',
    description: 'Turn text into ultra-realistic voiceovers',
    url: 'https://murf.ai',
  ),
  PremiumTool(
    name: 'SciSpace Copilot',
    description: 'Upload any document or research paper. Understand it like an expert. AI explains even the toughest PDFs.',
    url: 'https://scispace.com',
  ),
  PremiumTool(
    name: 'Writesonic',
    description: 'Unified AI Content Creation & Advanced SEO toolsets for Marketers, Agencies and Enterprises',
    url: 'https://writesonic.com',
  ),
  PremiumTool(
    name: 'Character.AI',
    description: 'Wants To Make Your Own A.I Characters and Have Fun.',
    url: 'https://character.ai',
  ),
];
