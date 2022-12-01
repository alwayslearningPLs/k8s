#!/bin/bash
#
# If you specify a "nodeSelector" with a "nodeAffinity", both must be satisfied for the Pod to be scheduled onto a node.
# 
# If you specify more than one matchExpressions group inside the "nodeSelectorTerms", then one of all of them must be satisfied.
#
# If you specify more than one matchExpression inside "matchExpressions" field, then all of them must be satisfied to schedule the pod.