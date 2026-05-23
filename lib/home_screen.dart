import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import 'profile_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: usersAsync.when(
          data: (users) {
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              itemCount: users.length + 2, // +2 for Header and Category Label
              itemBuilder: (context, index) {
                // 1. FIXED TOP APP HEADER
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Directory",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.dns_rounded,
                            color: Color(0xFF38BDF8),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // 2. SUBTLE CATEGORY ANCHOR (Breaks up the long list visually)
                if (index == 1) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 4),
                    child: Row(
                      children: [
                        const Text(
                          "ACTIVE CONNECTIONS",
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Divider(
                            color: const Color(0xFF1E293B),
                            thickness: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${users.length} total",
                          style: const TextStyle(
                            color: Color(0xFF38BDF8),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // Offset real data index calculation by 2 due to the headers above
                final user = users[index - 2];

                // 3. HIGH-DENSITY SEAMLESS LIST ITEM
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ProfileScreen(user: user)),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                        child: Row(
                          children: [
                            // Compact Premium Borderless Avatar
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: const Color(0xFF1E293B),
                              child: Image.network(
                                "https://api.dicebear.com/7.x/adventurer/png?seed=${user.id}",
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                const Icon(Icons.person, color: Colors.white60, size: 20),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // User Text Node (Allows long emails to stretch naturally)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    user.email,
                                    style: const TextStyle(
                                      color: Color(0xFF94A3B8),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Minimalist modern chevron
                            const Icon(
                              Icons.chevron_right_rounded,
                              color: Color(0xFF334155),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // High-density horizontal hair-line separator
                    Padding(
                      padding: const EdgeInsets.only(left: 60), // Aligns perfectly under text
                      child: Divider(
                        color: const Color(0xFF1E293B).withOpacity(0.6),
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF38BDF8)),
            ),
          ),
          error: (error, stack) => Center(
            child: Text(
              error.toString(),
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ),
      ),
    );
  }
}