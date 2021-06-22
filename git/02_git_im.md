# git itermediate

git 의 중급과정



## commit 메시지 바꾸기

직전의 커밋만 봐꿀 수 있음

**`git commit --amend`**







## git ignore

git이 관리하길 원치 않는 파일/폴더들을 정리한 파일

한 개의 repo 당 한개(이상)의 `.gitignore` 파일 필요

\https://www.toptal.com/developers/gitignore

로 접속하여 원하는 내용을 적고 , `.gitignore` 파일에 복사, 붙여넣기

## Local Branching

브렌치를 만들게(따게)되면 , 현재 브렌치의 모든 상황을 복사하여 , 평행세계를 만든다.



### create branch

```
# 브랜치 생성
$ git branch <new-branch-name>

# 브랜치 목록 확인
$ git branch 

# 브랜치 이동
$ git switch <branch-name>
```

```
#브랜치 생성 후 이동
$ git switch -c <new-branch-name>
```



### delete branch

```
# merge 완료된 브랜치 안전 삭제
$ git branch -d <branch-name>

# merge 미완료된 브랜치 강제 삭제
$ git branch -D <branch-name>
```





## 작업



### merge

1. fast Forwarding (꽃길)

   혼자 브렌치 사용하여 작업할 대부분의 경우 

   ```
   (master)
   $ git branch aaa
   $ git switch aaa
   
   (aaa)
   $
   
   #... 수정 수정 ...
   
   (aaa)
   $ git add .
   $ git commit -m 'aaa1'
   $ git switch master
   
   (master)
   $ git merge aaa
   ```

   

2. conflict -Auto merge (충돌 & 자동 병합)

   1. `a` 브랜치에서 커밋
   2. `master` 브랜치에서 커밋
   3. `(master) $ git merge a`
   4. **운이 좋아** 두 커밋이 켭치지 않음
   5. 자동으로 merge 완료

   

3. Conflict-Manula merge (충돌 & 수동 병합)

   1. `a` 브랜치에서 커밋
   2. `master` 브랜치에서 커밋
   3. `(master) $ git merge a`
   4. 두 커밋이 겹치는 구간이 있음
   5. 수동으로 충돌 해결 후 저장
   6. 직접 `git add`,`git commit`

   

   ​	

## 협업 Collaborating

1. 조장이 리모트 리포 생성
    	1. `README.md`,`.gitignore` 생성하며 리포 생성
    	2. setting > manage.access
    	3. 브랜치 생성 후 각자 개발 진행
    	4. 완료 후 **해당 브랜치의 내용**을 remote로 push
    	5. 코드 작성자가 remote에서 pullrequest(mergereqeust) =>결제요청을 진행
    	6. 팀의 합의에 따라 변경내용을 master로 `merge`
        	1. 충돌(conflict)이 난다면, 논의후 `resolve conficts`로 리모트에서 직접 수정
         	2. `commit merge`로 확정
    	7. 팀원들은 local master 에서 `git pull origin master`를 통해 모든 변경내용을 pull
    	8. 3번으로

