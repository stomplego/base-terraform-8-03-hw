locals {
  # Формируем имена через интерполяцию
  vm_web_name = "${var.vm_web_name_prefix}-${var.vm_web_env}-${var.vm_web_role}"
  vm_db_name  = "${var.vm_db_name_prefix}-${var.vm_db_env}-${var.vm_db_role}"
}
