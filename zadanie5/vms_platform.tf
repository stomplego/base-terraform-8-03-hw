# Общие переменные для формирования имен
variable "vm_web_name_prefix" { type = string, default = "develop" }
variable "vm_web_env" { type = string, default = "platform" }
variable "vm_web_role" { type = string, default = "web" }

variable "vm_db_name_prefix" { type = string, default = "develop" }
variable "vm_db_env" { type = string, default = "platform" }
variable "vm_db_role" { type = string, default = "db" }
