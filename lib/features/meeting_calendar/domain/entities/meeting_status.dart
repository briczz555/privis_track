enum MeetingStatus { scheduled, cancelled }

MeetingStatus meetingStatusFromApi(String value) =>
    value.toLowerCase() == 'cancelled'
    ? MeetingStatus.cancelled
    : MeetingStatus.scheduled;

String meetingStatusToApi(MeetingStatus status) =>
    status == MeetingStatus.cancelled ? 'cancelled' : 'scheduled';
