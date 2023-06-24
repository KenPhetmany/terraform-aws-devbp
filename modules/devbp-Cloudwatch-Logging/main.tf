resource "aws_cloudwatch_log_group" "cw_log_group" {
    name = var.cw_log_group_name
}

resource "aws_flow_log" "flow_log_group" {
    iam_role_arn = var.iam_role_arn
    log_destination = aws_cloudwatch_log_group.cw_log_group.arn
    traffic_type = var.traffic_type
    vpc_id = var.vpc_id
}

resource "aws_flow_log" "flow_log_s3" {
    log_destination = var.s3_arn
    log_destination_type = "s3"
    traffic_type = var.traffic_type
    vpc_id = var.vpc_id
  
}