
###从远程仓库切出本地不存在的分支
git ls-remote -h git@bitbucket.org:person/projectmarket.git HEAD

[可视化](https://learngitbranching.js.org/):js实现的可视化学习

```
$ git checkout -b yourtargetbranch remotes/rootlab/yourtargetbranch
Branch yourtargetbranch set up to track remote branch yourtargetbranch from rootlab.
```
###HEAD指针
```
移动已存在的分支到detached状态的分支git branch -f master C2
这个时候master分支以前的快照C3就变成了detached状态了

使用相对引用最多的就是移动分支。可以直接使用 -f 选项让分支指向另一个提交。例如:

git branch -f master HEAD~3

上面的命令会将 master 分支强制指向 HEAD 的第 3 级父提交

```



###rebase理解
```
假设当前工作分支为master，另一分支为B，运行"git rebase B"之后会发生三件事：

把master分支自分支点之后的所有commit撤销，并把它们暂存起来，也就是说把master分支回退到分支点

把B分支自分支点之后的所有更改全部应用到master分支

把第一步暂存的更改再应用到master分支
```

```
Rebase 实际上就是取出一系列的提交记录，“复制”它们，然后在另外一个地方逐个的放下去。

Rebase 的优势就是可以创造更线性的提交历史
```

###cherry-pick 操作
```
git cherry-pick 9b47dd dd4e49
```
###如果有冲突，则需要修改冲突文件，然后添加修改文件到暂存区，命令如下：
```
git add main.js
```
###最后执行
```
git cherry-pick --continue
```
###说明：
- 执行完git cherry-pick --continue后不需要commit了，该命令会自动提交
- git cherry-pick --abort可以放弃本次cherry-pick
- git cherry-pick 9b47dd dd4e49和git cherry-pick dd4e49 9b47dd这两个的结果可能会不一样，顺序很重要
