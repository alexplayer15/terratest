package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	// "github.com/stretchr/testify/assert"
)

func TestResourceIsReplaced(t *testing.T){

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../main",
    	Vars:         map[string]interface{}{},
		PlanFilePath: "../terraform.plan",
	})

	planOutput := terraform.InitAndPlanAndShowWithStruct(t, terraformOptions)
	t.Logf("Resources in plan: %v", planOutput.ResourceChangesMap)

	checkForSpecificResourceReplacement(t, planOutput, "module.web_server.aws_instance.terratest_ec2")
}

func TestResourceIsRunning(t *testing.T){

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../main",
    	Vars:         map[string]interface{}{},
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	validate(t, terraformOptions, "web_server_ip")
}

// func TestResourceIsNotReplacedAndRunning(t *testing.T) {
// 	t.Run("TestResourceIsReplaced", TestResourceIsReplaced)
// 	t.Run("TestResourceIsRunning", TestResourceIsRunning)
// }
