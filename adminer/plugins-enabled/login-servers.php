<?php
  require_once('plugins/login-servers.php');

  return new AdminerLoginServers([
    "db" => ["server" => "%DATABASE_HOST%:%DATABASE_PORT%", "driver" => "%DATABASE_DRIVER%"]
  ]);
?>