package test

import (
	"testing"
	"time"
	"github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestSomethingIsReplaced(t *testing.T) {
	
	terraformOptions := &terraform.Options{
		TerraformDir: "../main",
    Vars:         map[string]interface{}{},
	}
	
	planOutput := terraform.InitAndPlan(t, terraformOptions)

	replacementMsg := "forces replacement"
	assert.Contains(t, planOutput, replacementMsg, "expected a replacement in the plan output")
}

func validate(t *testing.T, opts *terraform.Options){
	url := terraform.Output(t, opts, "lb-url")
	http_helper.HttpGetWithRetry(t, url, nil, 200, "Hello, world", 10, 3*time.Second)
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
