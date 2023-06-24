resource "aws_cloudwatch_dashboard" "EC2_Dashboard" {
  dashboard_name = var.cw_name
  dashboard_body = <<EOF
{
    "widgets": [
        {
            "type": "explorer",
            "width": 24,
            "height": 15,
            "x": 0,
            "y": 0,
            "properties": {
                "metrics": [
                    {
                        "metricName": "CPUUtilization",
                        "resourceType": "AWS::EC2::Instance",
                        "stat": "Average"
                    },
                    {
                        "metricName": "NetworkIn",
                        "resourceType": "AWS::EC2::Instance",
                        "stat": "Average"
                    },
                    {
                        "metricName": "NetworkOut",
                        "resourceType": "AWS::EC2::Instance",
                        "stat": "Average"
                    }
                ],
                "labels": {
                    "key": "VpcId",
                    "value": "${var.vpc_id}"
                },
                "labels": [
                    {
                        "key": "State",
                        "value": "running"
                    }
                ],
                "widgetOptions": {
                    "legend": {
                        "position": "bottom"
                    },
                    "view": "timeSeries",
                    "rowsPerPage": 8,
                    "widgetsPerRow": 2
                },
                "period": 60,
                "title": "Running EC2 Instances"
            }
        }
    ]
}
EOF
}
