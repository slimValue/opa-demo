## opa 学习

@see 
https://www.openpolicyagent.org/docs/latest/#example

https://zhuanlan.zhihu.com/p/131595372
http://blog.newbmiao.com/2020/03/13/opa-quick-start.html

# Evaluate a trivial expression.
./opa eval "1*2+3"

# Evaluate a policy on the command line.
./opa eval -i input.json -d example.rego "data.example.violation[x]"

# Evaluate a policy on the command line and use the exit code.
./opa eval --fail-defined -i input.json -d example.rego "data.example.violation[x]"
echo $?

# Evaluate a policy on the command line and use the exit code.
opa run input.json

data.servers[0].protocols[1]


## OPA REPL
opa run example.rego repl.input:input.json


## server

opa run --server ./example.rego
ca
curl localhost:8181/v1/data/example/violation -d @v1-data-input.json -H 'Content-Type: application/json'
curl localhost:8181/v1/data/example/allow -d @v1-data-input.json -H 'Content-Type: application/json'


## build 

opa build -b .