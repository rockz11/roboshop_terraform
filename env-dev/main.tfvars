env="dev"
db_instances = {
  mongodb = {
    app_port      = 27017
    instance_type = "t3.small"
  }

  redis = {
    app_port      = 6379
    instance_type = "t3.small"
  }
  rabbimq = {
    app_port      = 5672
    instance_type = "t3.small"
  }
  mysql = {
    app_port      = 3306
    instance_type = "t3.small"
  }
}

app_instances = {
  catalogue = {
    app_port      = 8080
    instance_type = "t3.small"
  }

  cart = {
    app_port      = 8080
    instance_type = "t3.small"
  }
  user = {
    app_port      = 8080
    instance_type = "t3.small"
  }
  shiping = {
    app_port      = 8080
    instance_type = "t3.small"
  }
}
web_instances = {
  frontend = {
    app_port = 8080
    instance_type = "t3.small"
  }
  catalogue = {
    app_port = 8080
    instance_type = "t3.small"
  }
  catalogue = {
    app_port = 8080
    instance_type = "t3.small"
  }
}