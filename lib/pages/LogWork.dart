import 'package:flutter/material.dart';

class LogWorkPage extends StatefulWidget {
  @override
  _LogWorkPageState createState() => _LogWorkPageState();
}

class _LogWorkPageState extends State<LogWorkPage> {
  @override
  void initState() {
    super.initState();
    _hoursController.text = '00:00:00'; // Set default time
  }

  Widget _buildTimeColumn({
    required int value,
    required int max,
    required ValueChanged<int> onChanged,
  }) {
    return Container(
      width: 80,
      height: 150,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: onChanged,
        controller: FixedExtentScrollController(initialItem: value),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index > max) return null;
            return Center(
              child: Text(
                index.toString().padLeft(2, '0'),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  DateTime? _selectedDate;

  void _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitLog() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a date')),
        );
        return;
      }

      final task = _taskController.text;
      final hours = _hoursController.text;

      // Handle the log submission logic here
      print('Task: $task, Hours: $hours, Date: $_selectedDate');

      // Clear the fields after submission
      _taskController.clear();
      _hoursController.clear();
      setState(() {
        _selectedDate = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Log submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log Work'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log Your Work',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _taskController,
                decoration: InputDecoration(
                  labelText: 'Task Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Text(
                'Time Worked (HH:MM:SS)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTimeColumn(
                    value: int.tryParse(
                            _hoursController.text.split(':')[0] ?? '0') ??
                        0,
                    max: 23,
                    onChanged: (val) {
                      final parts = _hoursController.text.split(':');
                      final minute = parts.length > 1 ? int.parse(parts[1]) : 0;
                      final second = parts.length > 2 ? int.parse(parts[2]) : 0;
                      _hoursController.text =
                          '${val.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
                      setState(() {});
                    },
                  ),
                  Text(
                    ":",
                    style: TextStyle(fontSize: 60),
                  ),
                  _buildTimeColumn(
                    value: int.tryParse(
                            _hoursController.text.split(':')[1] ?? '0') ??
                        0,
                    max: 59,
                    onChanged: (val) {
                      final parts = _hoursController.text.split(':');
                      final hour = parts.length > 0 ? int.parse(parts[0]) : 0;
                      final second = parts.length > 2 ? int.parse(parts[2]) : 0;
                      _hoursController.text =
                          '${hour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
                      setState(() {});
                    },
                  ),
                  Text(
                    ":",
                    style: TextStyle(fontSize: 60),
                  ),
                  _buildTimeColumn(
                    value: int.tryParse(
                            _hoursController.text.split(':')[2] ?? '0') ??
                        0,
                    max: 59,
                    onChanged: (val) {
                      final parts = _hoursController.text.split(':');
                      final hour = parts.length > 0 ? int.parse(parts[0]) : 0;
                      final minute = parts.length > 1 ? int.parse(parts[1]) : 0;
                      _hoursController.text =
                          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}';
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _pickDate,
                    child: Text('Select Date'),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _submitLog,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    'Submit Log',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
