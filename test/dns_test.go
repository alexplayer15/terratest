package test

import (
	"testing"
	"time"
	"fmt"
	"github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
	// "github.com/stretchr/testify/assert"
)

// func TestSomethingIsReplaced(t *testing.T) {

// 	terraformOptions := &terraform.Options{
// 		TerraformDir: "../main",
//     Vars:         map[string]interface{}{},
// 	}
	
// 	planOutput := terraform.InitAndPlan(t, terraformOptions)

// 	replacementMsg := "forces replacement"
// 	assert.NotContains(t, planOutput, replacementMsg, "expected a replacement in the plan output")
// }

func validate(t *testing.T, opts *terraform.Options){
	lbUrl := terraform.Output(t, opts, "lb_url")
	url := fmt.Sprintf("http://%s", lbUrl)
	expectedResponseBody := "<h1>Hello World!</h1>"
	http_helper.HttpGetWithRetry(t, url, nil, 200, expectedResponseBody, 10, 3*time.Second)
}

func TestLoadBalancerIsRunning(t *testing.T){

	terraformOptions := &terraform.Options{
		TerraformDir: "../main",
    	Vars:         map[string]interface{}{},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	validate(t, terraformOptions)
}

// func TestLoadBalancerIsReplaced(t *testing.T){

// 	terraformOptions := &terraform.Options{
// 		TerraformDir: "../main",
//     	Vars:         map[string]interface{}{},
// 		PlanFilePath: "../terraform.plan",
// 	}

// 	planOutput := terraform.InitAndPlanAndShowWithStruct(t, terraformOptions)
// 	t.Logf("Resources in plan: %v", planOutput.ResourceChangesMap)

// 	checkForSpecificResourceReplacement(t, planOutput, "module.load_balancer.aws_lb.terratest_lb")

// }

// func checkForSpecificResourceReplacement(t *testing.T, plan *terraform.PlanStruct, resourceName string) {
//     for _, resourceChange := range plan.ResourceChangesMap {
//         // Check if the resource change matches the specific resource
//         if resourceChange.Address == resourceName {
// 			t.Logf("Resource %s has actions: %v", resourceName, resourceChange.Change.Actions)
//             // Check if the resource is being replaced
//             if resourceChange.Change.Actions[0] == "delete" {
//                 t.Fatalf("Resource %s is going to be replaced or destroyed!", resourceName)
//             }
//         }
//     }	
// }
