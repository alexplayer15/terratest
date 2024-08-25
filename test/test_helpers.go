package test

import (
	"testing"
	"time"
	"fmt"
	"github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
	// "github.com/stretchr/testify/assert"
)


func checkForSpecificResourceReplacement(t *testing.T, plan *terraform.PlanStruct, resourceName string) {
    for _, resourceChange := range plan.ResourceChangesMap {
        
        if resourceChange.Address == resourceName {
			t.Logf("Resource %s has actions: %v", resourceName, resourceChange.Change.Actions)
            
            if resourceChange.Change.Actions[0] == "delete" {
                t.Fatalf("Resource %s is going to be replaced or destroyed!", resourceName)
            }
        }
    }	
}

func validate(t *testing.T, opts *terraform.Options, resourceUrl string){
	resourceUrlOutput := terraform.Output(t, opts, resourceUrl)
	url := fmt.Sprintf("http://%s", resourceUrlOutput)
	expectedResponseBody := "<h1>Hello World!</h1>"
	http_helper.HttpGetWithRetry(t, url, nil, 200, expectedResponseBody, 10, 4*time.Second)
}