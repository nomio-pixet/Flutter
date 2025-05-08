import 'package:flutter/material.dart';

class TournamentDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String game;
  final String maps;
  final String prizePool;

  const TournamentDetailScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.game,
    required this.maps,
    required this.prizePool,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: const TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: const TabBar(
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.deepPurple,
            tabs: [
              Tab(text: 'Information'),
              Tab(text: 'Participant'),
              Tab(text: 'Results'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // 1. Information Tab
            SingleChildScrollView(
              child: Column(
                children: [
                  // Tournament image
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        'assets/images/home_tournamentlist.jpg',
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // "Tournament format" гарчиг
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 16, top: 8, bottom: 4),
                    child: Text(
                      'Tournament format',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Дөрвөлжин card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Game: ',
                              style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              game,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Maps label болон value-г баганаар (Column) байрлуулна
                        const Text(
                          'Maps:',
                          style: TextStyle(
                            color: Color(0xFF6C63FF),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          maps, // жишээ нь: 'Erangel / Miramar / Sanhok'
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'PrizePool: ',
                              style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              prizePool,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Team Register товч (card-ны гадна, төвд)
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Center(
                      child: SizedBox(
                        width: 260,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6C3DF4), // purple
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Team Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Point system гарчиг (card-аас тусад нь)
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 16, top: 12, bottom: 4),
                    child: Text(
                      'Point system:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Point system card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Header + box-уудыг баганаар зэрэгцүүлнэ
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Зүүн Place багана
                            Column(
                              children: [
                                _HeaderBox(text: 'Place'),
                                const SizedBox(height: 8),
                                _PointBox(place: '1', gradient: true),
                                const SizedBox(height: 8),
                                _PointBox(place: '2', gradient: true),
                                const SizedBox(height: 8),
                                _PointBox(place: '3', gradient: true),
                                const SizedBox(height: 8),
                                _PointBox(place: '4', gradient: false, bgColor: const Color(0xFF232323)),
                              ],
                            ),
                            // Зүүн Point багана
                            Column(
                              children: [
                                _HeaderBox(text: 'Point'),
                                const SizedBox(height: 8),
                                _PointValueBox(point: '10pts', color: const Color(0xFFED4956), gradient: true),
                                const SizedBox(height: 8),
                                _PointValueBox(point: '6pts', color: const Color(0xFFED4956), gradient: true),
                                const SizedBox(height: 8),
                                _PointValueBox(point: '5pts', color: const Color(0xFFED4956), gradient: true),
                                const SizedBox(height: 8),
                                _PointValueBox(point: '4pts', color: Colors.white, gradient: false, bgColor: const Color(0xFF232323)),
                              ],
                            ),
                            // Баруун Place багана
                            Column(
                              children: [
                                _HeaderBox(text: 'Place'),
                                const SizedBox(height: 8),
                                _PointBox(place: '5', gradient: false, bgColor: const Color(0xFF232323)),
                                const SizedBox(height: 8),
                                _PointBox(place: '6', gradient: false, bgColor: const Color(0xFF232323)),
                                const SizedBox(height: 8),
                                _PointBox(place: '7-8', gradient: false, bgColor: const Color(0xFF232323)),
                                const SizedBox(height: 8),
                                _PointBox(place: '9-16', gradient: false, bgColor: const Color(0xFF232323)),
                              ],
                            ),
                            // Баруун Point багана
                            Column(
                              children: [
                                _HeaderBox(text: 'Point'),
                                const SizedBox(height: 8),
                                _PointValueBox(point: '3pts', color: Colors.white70, gradient: false, bgColor: const Color(0xFF232323)),
                                const SizedBox(height: 8),
                                _PointValueBox(point: '2pts', color: Colors.white70, gradient: false, bgColor: const Color(0xFF232323)),
                                const SizedBox(height: 8),
                                _PointValueBox(point: '1pts', color: Colors.white70, gradient: false, bgColor: const Color(0xFF232323)),
                                const SizedBox(height: 8),
                                _PointValueBox(point: '0pts', color: Colors.white70, gradient: false, bgColor: const Color(0xFF232323)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          '1 Elimination = 1 Point',
                          style: TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  // Schedule гарчиг (card-аас тусад нь)
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 16, top: 12, bottom: 4),
                    child: Text(
                      'Schedule:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Card хэлбэртэй schedule
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            _ScheduleCell(
                              title: 'Registration start',
                              date: '2025/03/17',
                              time: '23:03',
                            ),
                            _ScheduleCell(
                              title: 'Registration end',
                              date: '2025/03/27',
                              time: '23:03',
                            ),
                          ],
                        ),
                        SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            _ScheduleCell(
                              title: 'Tournament start',
                              date: '2025/03/28',
                              time: '15:03',
                            ),
                            _ScheduleCell(
                              title: 'Tournament end',
                              date: '2025/04/07',
                              time: '15:04',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 2. Participant Tab
            ParticipantTab(),
            // 3. Results Tab
            ResultsTab(),
          ],
        ),
      ),
    );
  }
}

// PARTICIPANT TAB
class ParticipantTab extends StatelessWidget {
  final List<Map<String, String>> groupB = const [
    {'name': 'SILENT CREW', 'logo': 'assets/images/silentcrew.jfif'},
    {'name': 'EXODUS', 'logo': 'assets/images/exodus.png'},
    {'name': 'No Sympathy', 'logo': 'assets/images/nosympathy.jfif'},
    {'name': 'Running Turtles', 'logo': 'assets/images/runningturtle.webp'},
    {'name': 'revolution', 'logo': 'assets/images/revolution.jpg'},
    {'name': 'Phantom', 'logo': 'assets/images/phantom.webp'},
    {'name': 'REVOLUTION team', 'logo': 'assets/images/revolutionteam.png'},
    {'name': 'SEE THE FUTURE', 'logo': 'assets/images/seethefuture.png'},
  ];

  final List<Map<String, String>> groupA = const [
    {'name': 'FAM', 'logo': 'assets/images/minecraft.webp'},
    {'name': 'SILENT CREW', 'logo': 'assets/images/gita5.jfif'},
    {'name': 'TEAM X', 'logo': 'assets/images/csgo.png'},
    {'name': 'PHANTOM', 'logo': 'assets/images/brigade.jpg'},
  ];

  const ParticipantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      children: [
        // Group B гарчиг
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8, top: 8),
          child: Text(
            'GROUP B',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
        _TeamGrid(teams: groupB),
        // Group A гарчиг
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8, top: 18),
          child: Text(
            'GROUP A',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
        _TeamGrid(teams: groupA),
      ],
    );
  }
}

// Туслах widget: багуудын grid
class _TeamGrid extends StatelessWidget {
  final List<Map<String, String>> teams;
  const _TeamGrid({required this.teams});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: teams.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // tom dorwoljin zurag
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  teams[index]['logo']!,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  teams[index]['name']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// RESULTS TAB
class ResultsTab extends StatefulWidget {
  const ResultsTab({super.key});

  @override
  State<ResultsTab> createState() => _ResultsTabState();
}

class _ResultsTabState extends State<ResultsTab> {
  int qualifier = 0;
  String selectedGroup = 'Group B';
  String selectedDay = 'March 28';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F6FB),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          // Qualifier filter
          Row(
            children: [
              _RadioChip(
                label: 'Open Qualifier',
                value: 0,
                groupValue: qualifier,
                onChanged: (value) {
                  setState(() {
                    qualifier = value!;
                  });
                },
                color: Colors.deepPurple,
              ),
              const SizedBox(width: 8),
              _RadioChip(
                label: 'Closed Qualifier',
                value: 1,
                groupValue: qualifier,
                onChanged: (value) {
                  setState(() {
                    qualifier = value!;
                  });
                },
                color: Colors.deepPurple,
              ),
              const SizedBox(width: 8),
              _RadioChip(
                label: 'Main Event',
                value: 2,
                groupValue: qualifier,
                onChanged: (value) {
                  setState(() {
                    qualifier = value!;
                  });
                },
                color: Colors.deepPurple,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Select Group
          const Text(
            'Select Group',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          DropdownButton<String>(
            value: selectedGroup,
            isExpanded: true,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: 'Group A', child: Text('Group A')),
              DropdownMenuItem(value: 'Group B', child: Text('Group B')),
            ],
            onChanged: (value) {
              setState(() {
                selectedGroup = value!;
              });
            },
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
          ),
          const SizedBox(height: 8),
          // Select Day
          const Text(
            'Select Day',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          DropdownButton<String>(
            value: selectedDay,
            isExpanded: true,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: 'March 27', child: Text('March 27')),
              DropdownMenuItem(value: 'March 28', child: Text('March 28')),
            ],
            onChanged: (value) {
              setState(() {
                selectedDay = value!;
              });
            },
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
          ),
          const SizedBox(height: 16),
          // Match-3 button (BottomSheet)
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 0,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  ),
                  builder: (context) => Container(
                    height: 220,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Modal BottomSheet',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close BottomSheet'),
                        ),
                      ],
                    ),
                  ),
                ),
                child: const Text('Match-3'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // See group overall rankings (OutlinedButton, том хүрээтэй)
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepPurple,
              side: const BorderSide(color: Colors.deepPurple, width: 2.2), // Хүрээг томруулсан!
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onPressed: () {},
            child: const Text('SEE GROUP OVERALL RANKINGS'),
          ),
          const SizedBox(height: 20),
          // Match Ranking + see MVP (AlertDialog)
          Row(
            children: [
              const Text(
                'Match Ranking',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 0,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      title: const Text('AlertDialog'),
                      content: const Text('This is a demo alert dialog.\nWould you like to approve of this message?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Approve'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'see MVP',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // No match result
          const Center(
            child: Text(
              'No match result',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom radio chip widget
class _RadioChip extends StatelessWidget {
  final String label;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;
  final Color color;

  const _RadioChip({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<int>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: color,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          label,
          style: TextStyle(
            color: groupValue == value ? color : Colors.black87,
            fontWeight: groupValue == value ? FontWeight.bold : FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String title;
  const _HeaderCell({required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black87),
    );
  }
}

class _PointBox extends StatelessWidget {
  final String place;
  final bool gradient;
  final bool isLeft;
  final Color? bgColor;

  const _PointBox({
    required this.place,
    this.gradient = false,
    this.isLeft = true,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 32,
      decoration: BoxDecoration(
        gradient: gradient
            ? const LinearGradient(
                colors: [Color(0xFF6C3DF4), Color(0xFFB983FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: gradient ? null : bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        place,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _PointValueBox extends StatelessWidget {
  final String point;
  final Color color;
  final bool gradient;
  final Color? bgColor;

  const _PointValueBox({
    required this.point,
    required this.color,
    this.gradient = false,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 32,
      decoration: BoxDecoration(
        color: gradient ? Colors.white : bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: gradient
            ? Border.all(color: Color(0xFF6C3DF4), width: 1.2)
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        point,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _ScheduleCell extends StatelessWidget {
  final String title;
  final String date;
  final String time;

  const _ScheduleCell({
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Огноо
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                // Цаг
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBox extends StatelessWidget {
  final String text;
  const _HeaderBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _DiagonalLinePainter extends CustomPainter {
  final Color color;
  final double opacity;
  _DiagonalLinePainter({required this.color, this.opacity = 0.18});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..strokeWidth = 1.5;
    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}