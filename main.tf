resource "google_dataproc_metastore_table_iam_binding" "dataproc_metastore_table_iam_bindings" {
  for_each = var.dataproc_metastore_table_iam_bindings

  database_id = each.value.database_id
  members     = each.value.members
  role        = each.value.role
  service_id  = each.value.service_id
  table       = each.value.table
  location    = each.value.location
  project     = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

