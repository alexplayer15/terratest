run "check_for_specific_resource_replacement" {
  command = plan
 
  module {
    source = "../main"
  }

  assert {
    condition = alltrue([

      for change in terraform.plan.resource_changes :
      (
        change.address != "module.web_server.aws_instance.terratest_ec2" || !(contains(change.change.actions, "delete"))
      )
    ])

    error_message = "Resource module.web_server.aws_instance.terratest_ec2 is going to be replaced or destroyed!"
  }
}
