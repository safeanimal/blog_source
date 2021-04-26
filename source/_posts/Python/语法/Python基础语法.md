---
title: Python基础语法
date: 2020-05-03 16:19:27
tags: Python
---

## 数据

```python
print(3+2)#5
print(3-2)#1
print(3*2)#6
print(3/2)#1.5
print(3//2)#1
print(3%2)#1
print(3**2)#9
print(2.13232+1.000000)#3.13232
#数字转字符串
age=20
print('Happy '+str(age)+'th Birthday!')#Happy 20th Birthday!

num=66
print('My favorite number is '+str(num))#My favorite number is 66
```

<!--more-->

## 输入

```python
#message=input("Tell me something, and I will repeat it back to you:")
#print(message)


#prompt="If you tell us who you are, we can personalize the messages you see."
#prompt+="\nWhat is your first name?"

#name=input(prompt)
#print("\nHello, "+name+"!")

#输入数字
height=input("How tall are you, in inches? ")
height=int(height)

if height>=26:
    print("\nYou're tall enough to ride!")
else:
    print("\nYou'll be able to ride when you're a little older")
```

## 输出

```python
print('What is your name?')#What is your name?
name='My name is Guorui Sang'
print(name)#My name is Guorui Sang
name='I forget your name.'
print(name)#I forget your name.

yourName='Eric'
print('Hello '+yourName+', would your like to learn some Python today?')#Hello Eric, would your like to learn some Python today?
yourName='donald trump'
print(yourName.title())#Donald Trump
print(yourName.upper())#DONALD TRUMP
print(yourName.lower())#donald trump

print('Albert Einstein once said, \"A person who never made a mistake never tried anything new.\"')
#Albert Einstein once said, "A person who never made a mistake never tried anything new."
yourName=' tomas edison '
print(yourName.lstrip())#tomas edison 
print(yourName.rstrip())# tomas edison
print(yourName.strip())#tomas edison
```

## if

```python
cars=['audi','bmw','subaru','toyota']

for car in cars:
    if car=='bmw':
        print(car.upper())
    else:
        print(car.title())
#Audi
#BMW
#Subaru
#Toyota
      
#判断值是否在列表中
requested_toppings=['mushrooms','onions','pineapple']
if 'mushrooms' in requested_toppings:
    print('I am here!')

if 'sandwiches' not in requested_toppings:
    print('Give me sandwiches!')
#I am here!
#Give me sandwiches!


#if elif else
age=12
if age<3:
    print("Your admission cost is $0.")
elif age<18:
    print("Your admission cost is $5.")
else:
    print("Your admission cost is $10.")

#Your admission cost is $5.    
    
for car in cars:
    print("I would like to drive "+car)
#I would like to drive audi
#I would like to drive bmw
#I would like to drive subaru
#I would like to drive toyota


for car in cars:
    if car=='bmw':
        print("Wow!")
    else:
        print("Not you.")
#Not you.
#Wow!
#Not you.
#Not you.

#先判断列表是否为空
cars=[]

if cars:
    print("You can really drive.")
else:
    print("Are you kidding me?")
    
#Are you kidding me?  
```

## while

```python
current_number=1
while current_number<=5:
    print(current_number)
    current_number+=1

prompt="Tell me something, input \"quit\" to exit"
message=""

while message!="quit":
    message=input(prompt)
    if message!="quit":
        print(message)

#while处理列表
unconfirmed_users=['alice','brian','candace']
confirmed_users=[]

while unconfirmed_users:
    current_user=unconfirmed_users.pop()

    print("Verifying user: "+current_user.title())
    confirmed_users.append(current_user)

print("\nThe following users have been confirmed:")
for confirmed_user in confirmed_users:
    print(confirmed_user.title())

pets=['dog','cat','dog','goldfish','cat','rabbit','cat']
print(pets)

while 'cat' in pets:
    pets.remove('cat')

print(pets)

#while创建字典
responses={}
polling_active=True

while polling_active:
    name=input("\nWhat is your name? ")
    response=input("Which mountain would you like to climb someday?")

    responses[name]=response

    repeat=input("Would you like to let another person respond? (yes/no)")
    if repeat=='no':
        polling_active=False

print("\n--- Poll Results ---")
for name,response in responses.items():
    print(name+" would like to climb "+response+".")


```

## list

```python
bicycles=['trek','cannondale','redline','specialized']
print(bicycles)
print(bicycles[0].title())

print(bicycles[-1])
print(bicycles[-2])

bicycles[0]='Gugu'
print(bicycles[0])

bicycles.append('Haha')
print(bicycles[-1])

name=[]
name.append('Alice')
name.append('Bob')
print(name[-1])
print(name[0])

name.insert(0,'Mike')
print(name[0])

del name[0]
print(name[0])

print(name)
last=name.pop()
first=name.pop(0)
print(name)
print(last)

order=['first','second','third','forth']
e='first'
order.remove(e)
print(order)
print(e)

cars=['c','b','a']
cars.sort()
print(cars)

cars.sort(reverse=True)
print(cars)

cars=['b','c','a']
print(sorted(cars,reverse=True))
print(cars)

cities=['Beijing','Shanghai','Shenzhen']
cities.reverse()
print(cities)
cities.reverse()
print(cities)

print(len(cities))

```

```python
#列表操作
cities=['Beijing','Shanghai','Guangzhou','shenzhen']
for city in cities:
    print(city)

for city in cities:
    print(city+'is where I want to go')

for city in cities:
    print(city+'wait for me')
    print('I am coming!')

print('That\'s how it works')

for value in range(1,3):
    print(value*value)

for value in range(1,11,2):
    print(value)

squares=[]
for value in range(1,11):
    squares.append(value*value)
print(squares)

digits=list(range(1,11))
print(digits)
print(max(digits))
print(min(digits))
print(sum(digits))

squares=[value**2 for value in range(1,11)]
print(squares)

#练习
for value in range(1,21):
    print(value)

million=[value for value in range(1,1000001)]
#for value in million:
#    print(value)

print(min(million))
print(max(million))
print(sum(million))

list=[value for value in range(1,21,2)]
for value in list:
    print(value)

list=[value for value in range(3,31,3)]
for value in list:
    print(value)

list=[value**3 for value in range(1,11)]
for value in list:
    print(value)

#使用列表的一部分

#切片
players=['Haha','Hehe','Heihei','Xixi']
print(players[0:3])
print(players[1:4])
print(players[:4])
print(players[2:])
print(players[-3:])#输出最后3名

#遍历切片
for player in players[2:]:
    print(player)

#复制列表
my_players=players[:]
print(my_players)
my_players[0]='???'
print(my_players)
print(players)
```

## tuple

```python
dimensions=(200,50)
print(dimensions[0])
print(dimensions[1])
#dimensions[0]=20 这个操作不行，元组为不可变列表

for dimension in dimensions:
    print(dimension)
#但是可以重新定义元组
dimensions=(30,30)
print(dimensions)

```

## dictionary

```python
#定义
alien_0={'color':'green','points':5}
print(alien_0['color'])
print(alien_0['points'])

#添加键值对
alien_0['x_position']=0
alien_0['y_position']=25
print(alien_0)

#修改键值对
alien_0['color']='yellow'
print("The alien is now "+alien_0['color']+".")

#删除键值对
del alien_0['points']
print(alien_0)

info={
    'first_name':'Sang',
    'last_name':'Guorui',
    'age':'20',
    'city':'Guoyang',
    'stature':'20'
}
print(info)

#遍历字典
for key,value in info.items():
    print("Key: "+key)
    print("Value: "+value)

#遍历字典中的键
for key in info.keys():
    print("\nKey:"+key)

if 'Country' not in info.keys():
    print("Oh, where are you from?")

for key in sorted(info.keys()):
    print(key)

#遍历字典的值
for value in set(info.values()):
    print(value)

#嵌套

#列表中存字典
alien_0={'color':'green','points':5}
alien_1={'color':'yellow','points':10}
alien_2={'color':'red','points':15}

aliens=[alien_0,alien_1,alien_2]

for alien in aliens:
    print(alien)

#字典中存列表
pizza={
    'crust':'thick',
    'toppings':['mushrooms','extra cheese']
}

print("You ordered a "+pizza['crust']+"-crust pizza "+
      "with the following toppings:")

for topping in pizza['toppings']:
    print("\t"+topping)

#字典中存字典
users={
    'aeinstein':{
        'first':'albert',
        'last':'einstein',
        'location':'princeton'
    },
    'mcurie':{
        'first':'marie',
        'last':'curie',
        'location':'paris'
    }
}

for username, user_info in users.items():
    print("\nUsername: "+username)
    full_name=user_info['first']+" "+user_info['last']
    location=user_info['location']

    print("\tFull name: "+full_name.title())
    print("\tLocation: "+location.title())
```

## function

```python
#无形参
def greet_user():
    print("Hello!")

greet_user()

#有形参
def greet_user(username):
    print("Hello, "+username.title()+"!")

greet_user("jesse")

#位置实参
def describe_pet(animal_type,pet_name):
    print("\nI have a "+animal_type+".")
    print("My "+animal_type+"'name is "+pet_name.title()+".")

describe_pet('hamster','harry')

#关键字实参
describe_pet(animal_type='hamster',pet_name='harry')

#给形参提供默认值
def show(name='Sang',city='Guoyang'):
    print(name+" is living in "+city)

show()

#给函数提供返回值
def get_formatted_name(first_name,last_name):
    full_name=first_name+' '+last_name
    return full_name.title()

musician=get_formatted_name('jimi','hendrix')
print(musician)

#可选实参
def get_formatted_name(first_name,last_name,middle_name=''):
    if middle_name:
        full_name=first_name+' '+middle_name+' '+last_name
    else:
        full_name=first_name+' '+last_name
    return full_name.title()

musician=get_formatted_name('jimi','hendrix')
print(musician)

musician=get_formatted_name('john','hooker','lee')
print(musician)

#返回字典
def build_person(first_name,last_name):
    person={'first':first_name,'last':last_name}
    return person

musician=build_person('jimi','hendrix')
print(musician)

def build_person(first_name,last_name,age=''):
    person={'first':first_name,'last':last_name}
    if age:
        person['age']=age
    return person

musician=build_person('jimi','hendrix',age=27)
print(musician)

#传递列表
def greet_users(names):
    for name in names:
        msg="Hello, "+name.title()+"!"
        print(msg)

usernames=['hannah','ty','margot']
greet_users(usernames)

#禁止函数修改列表
def clear(names):
    while names:
        names.pop()

clear(usernames[:])
print(usernames)

#传递任意数量的实参
def make_pizza(*toppings):
    print(toppings)

make_pizza('pepperoni')
make_pizza('mushrooms','green peppers','extra cheese')

#位置实参+任意数量实参
def make_pizza(size,*toppings):
    print("\nMaking a "+str(size)+"-inch pizza with the following toppings:")
    for topping in toppings:
        print("- "+topping)

make_pizza(16,'pepperoni')
make_pizza(12,'mushroom','green peppers','extra cheese')

#任意数量的关键字实参
def build_profile(first,last,**user_info):
    profile={}
    profile['first_name']=first
    profile['last_name']=last
    for key,value in user_info.items():
        profile[key]=value
    return profile

user_profile=build_profile('albert','einstein',location='princeton',field='physics')
print(user_profile)


```

