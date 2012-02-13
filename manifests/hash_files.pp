$files = {
  '/tmp/test/a' => {
    'mode'   => '0777',
    'source' => 'puppet:///modules/hash_files/test/a'
  }
}

create_resources('file',$files)
