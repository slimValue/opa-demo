# 运行测试 (打包 + 运行)
.PHONY: run

# RUN
# 交互式运行（REPL）命令

# 简单运行
run:
	opa run conf

# 可以用repl.input:<path to input.json>的方式传递输入
run-input:
	opa run conf repl.input:conf/input.json


# EVAL
# 查询策略结果
# -f 指定返回格式，默认json，还支持values,bindings,pretty,source

eval:
	opa eval -f values -d conf -i conf/input.json "data.example_rbac"


# debug模式 配合trace(xx)使用
eval-debug:
	opa eval -f pretty -d conf -i conf/input.json "data.example_rbac.allow" --explain=notes

# 性能分析 --metrics, --instrument, --profile