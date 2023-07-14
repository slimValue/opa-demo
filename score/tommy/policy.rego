package tommy

# 查询分数线是否满足条件
result = {"score_line": 1, "msg": "恭喜你考上一本"} {
    data.tommy.achievement[input.alias].yiben.score <= input.score
} else = {"score_line": 2, "msg": "恭喜你考上二本"}{
    data.tommy.achievement[input.alias].erben.score <= input.score
} else = {"score_line": -1, "msg": "没考上"}