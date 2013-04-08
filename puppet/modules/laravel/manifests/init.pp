class laravel {

  # Set the correct permissions on the 'app/storage' directory, if it exists.
  if $storage_directory_exists == 'true' {
    file { '/vagrant/app/storage':
      mode    => 0777,
      recurse => true,
    }
  }

}
