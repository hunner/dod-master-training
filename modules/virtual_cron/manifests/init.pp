class virtual_cron {
  @cron { '/bin/echo one':
    user   => 'root',
    hour   => '2',
    minute => '0',
  }
  @cron { '/bin/echo two':
    user   => 'root',
    hour   => '2',
    minute => '30',
  }
  @cron { '/bin/echo three':
    user   => 'root',
    hour   => '3',
    minute => '0',
  }
}
