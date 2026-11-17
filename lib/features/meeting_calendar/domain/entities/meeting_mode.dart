enum MeetingMode { online, onsite }

MeetingMode meetingModeFromApi(String value) =>
    value.toLowerCase() == 'onsite' ? MeetingMode.onsite : MeetingMode.online;

String meetingModeToApi(MeetingMode mode) =>
    mode == MeetingMode.onsite ? 'onsite' : 'online';
