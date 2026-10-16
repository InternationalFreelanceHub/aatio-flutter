import 'package:flutter/material.dart';

class Tool {
  final String name;
  final String enjoyName;
  final String url;
  final IconData icon;
  final Color color;
  final String? image;
  final String? interstitialKey;
  final String? bannerKey;

  const Tool({
    required this.name,
    required this.enjoyName,
    required this.url,
    required this.icon,
    required this.color,
    this.image,
    this.interstitialKey,
    this.bannerKey,
  });
}

// Same order as the Popular list in the old app.
const List<Tool> popularTools = [
  Tool(
    name: 'Deepseek AI',
    enjoyName: 'Deepseek AI',
    url: 'https://chat.deepseek.com',
    icon: Icons.query_stats,
    color: Color(0xFF8A3FFC),
    image: 'assets/images/deepseek.png',
    bannerKey: 'deepseek',
  ),
  Tool(
    name: 'Perplexity',
    enjoyName: 'Perplexity',
    url: 'https://www.perplexity.ai',
    icon: Icons.public,
    color: Color(0xFFC13AD6),
    image: 'assets/images/perplexity.png',
    interstitialKey: 'perplexity',
  ),
  Tool(
    name: 'Chatsonic',
    enjoyName: 'Chatsonic',
    url: 'https://writesonic.com/chat',
    icon: Icons.smart_toy,
    color: Color(0xFF3FA9F5),
    image: 'assets/images/chatsonic.png',
  ),
  Tool(
    name: 'Galileo',
    enjoyName: 'Galileo ( Stitch )',
    url: 'https://www.usegalileo.ai/explore',
    icon: Icons.explore,
    color: Colors.white,
    image: 'assets/images/galileo.png',
  ),
  Tool(
    name: 'Microsoft Copilot',
    enjoyName: 'Microsoft Copilot',
    url: 'https://copilot.microsoft.com',
    icon: Icons.settings,
    color: Color(0xFF3B82F6),
    image: 'assets/images/copilot.png',
  ),
  Tool(
    name: 'Claude AI',
    enjoyName: 'Claude AI',
    url: 'https://claude.ai',
    icon: Icons.auto_awesome,
    color: Color(0xFFE8A06A),
    bannerKey: 'claude',
  ),
  Tool(
    name: 'Meta AI',
    enjoyName: 'Meta AI',
    url: 'https://www.meta.ai',
    icon: Icons.blur_circular,
    color: Color(0xFFF4A6B8),
    image: 'assets/images/meta.png',
  ),
  Tool(
    name: 'Chatgpt',
    enjoyName: 'Chatgpt',
    url: 'https://chatgpt.com',
    icon: Icons.psychology,
    color: Color(0xFF2BB5C9),
    image: 'assets/images/chatgpt.png',
    interstitialKey: 'chatgpt',
  ),
];
