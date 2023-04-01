---
layout: post
title: LLMs are compilers 
root: "../"
blog: "true"
---
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML"></script>

_Or how to think about prompting._



<center>
<img src="https://raw.githubusercontent.com/madaan/madaan.github.io/master/images/llm_compiler/header.jpg" alt="LLM Compiler" width="300" height="350">
</center>


###### Contents
{:.no_toc}
* Will be replaced with the ToC, excluding the "Contents" header
{:toc}

## Abstractions evolve


Here is a simple example of how abstractions evolve. Consider the problem of adding two numbers. Given a specification like "Given two numbers, return their sum," we can write a program that solves this problem at different levels of abstraction.


- Machine code: The lowest level of abstraction. The program is a sequence of instructions that are executed by the CPU. The instructions are represented as a sequence of bytes.
```
00101010 00000000 00000001
00101010 00000001 00000010
10010001 00000010 00000000
00111101 00000000 00000011
00111010 00000000 00000011
```

- Assembly code: A higher level of abstraction. The program is a sequence of instructions that are executed by the CPU. The instructions are represented as a sequence of mnemonics.

```
MOV AX, 1     ; Load the first number (1) into register AX
MOV BX, 2     ; Load the second number (2) into register BX
ADD AX, BX    ; Add the numbers in AX and BX, store the result in AX
MOV CX, AX; Move the result to register CX
; The following code is platform-dependent and prints the value in CX
```


- C code: A higher level of abstraction. The program is a sequence of instructions that are executed by the CPU. The instructions are represented as a sequence of keywords.

```c
#include <stdio.h>

int main() {
    int a = 1;
    int b = 2;
    int sum = a + b;
    printf("The sum is: %d\n", sum);
    return 0;
}
```


- Python code: A higher level of abstraction. The program is a sequence of instructions that are executed by the CPU. The instructions are represented as a sequence of keywords.

```python
a = 1
b = 2
sum = a + b
print(f"The sum is: {sum}")
```

<hr>


## Common thread

- There is something we want to solve.

  - <b>Task:</b> Add two numbers
  - <b>Input:</b> Two numbers
  - <b>Output:</b> Their sum


- Increasing levels of abstraction

  - Machine code
  - Assembly code
  - C code
  - Python code



- Each level of abstraction is a different representation of the same task.

  - Machine code: A sequence of bytes, no translation required
  - Assembly code: A sequence of mnemonics, assembler
  - C code: A sequence of keywords compiler
  - Python code: A sequence of keywords, interpreter

- <b>Yet, there is a common thread:</b>
  - A way to communicate the task to the processor.
  - Just different ways to represent the same task.

- You are not teaching the task to the processor--you are just specifying the task differently. The processor already knows how to add two numbers.


<hr>

## Language models are compilers
  
- A useful way to think about prompting is as another programming language.

- The language model is the interpreter:


<img src="https://raw.githubusercontent.com/madaan/madaan.github.io/master/images/llm_compiler/llmcompiler.jpg" alt="LLM Compiler" width="500" height="300">


- Input:
```
Task: Add two numbers.
Input: 4, 6

- Output:
```
Output: The output is 10.
```


- Code:
```
Task: Add two numbers.
Input: 4, 6
Output: The output is
```



<hr>


## Prompting is expressive

- Recall: the goal is to _specify_ the task, not to _teach_ the task.

### Specification with instructions

<h4 style="color: red;">Generate a poem that rhymes with 'cat' and has 10 lines."</h4>


```
Bat, sat, chat, fat
A furry friend that's really neat,
It purrs and meows with its tiny feet,
It's the cutest thing when it's on your mat.
```


<h4 style="color: red;">"Write a program in Python to test if `n` is prime"</h4>

```python
#Input an integer
n = int(input('Enter an integer: '))

#If n is less than 2, it is not prime
if n < 2:
    print(n, 'is not a prime number')

#If n is greater than 2, check if it is prime
else:
    is_prime = True
    
    for i in range(2, n):
        if n % i == 0:
            is_prime = False
            break
            
    if is_prime:
        print(n, 'is a prime number')
    else:
        print(n, 'is not a prime number')
```
<h3 style="color: blue;"> Specification with examples </h3>

<ul>
<li><strong>AKA autocomplete: In addition to or instead of instructions, we can provide examples</strong></li>
</ul>

<h4 style="color: red;">Prompt:</h4>

```python
    input_1

    output_1

    input_2

    output_2

    input_3

    ???
```

<h3>Feed the prompt to the model:</h3>

```python
    output_3
```

<h3>Example: math reasoning</h3>

<h4 style="color: red;">Prompt</h4>

<pre><code class="language-python">Q: Jason had 20 lollipops. He gave Denny some lollipops. 
    Now Jason has 12 lollipops. How many lollipops did Jason
    give to Denny?
    A: The answer is 8


    Q: There were nine computers in the server room. 
    Five more computers were installed each day, from monday
    to thursday. How many computers are now in the server room?</code></pre>

<h4>    Model completion:</h4>

<pre><code class="language-python">A: The answer is 29</code></pre>

<p><a href="images/llm_compiler/llmcompiler.png"><img src="images/llm_compiler/llmcompiler.png" alt=""></a></p>



- <b>Start playing with the model:</b> [https://platform.openai.com/playground](https://platform.openai.com/playground)

<hr>

## LLMs are _stochastic_ compilers

- Yes, the LLMs can interpret your instructions and solve the task. BUT...
  - They are not deterministic.
  - They fail

<img src="https://raw.githubusercontent.com/madaan/madaan.github.io/master/images/llm_compiler/instr_fail.jpg" alt="LLM Compiler" width="600" height="800">

- <b>But they listen if you talk nicely to them<b>:


<img src="https://raw.githubusercontent.com/madaan/madaan.github.io/master/images/llm_compiler/instr_guided_v2.jpg" alt="LLM Compiler" width="600" height="800">

<hr>

## Different prompting (programming) styles

- So far, we have seen two different programming styles:
  - Specification with instructions
  - Specification with examples


- We also saw that LLMs are stochastic, we may have to try several "variants" of the program to get the right one.


- Regular programs also come in various flavors:

    - Stylistic differences

    ```python
    # Good naming and formatting
    def calculate_area(width, height):
        return width * height

    # Poor naming and formatting
    def calc_a(w,h):return w*h
    ```

    - Implementation differences

    ```python
    # Using a set to remove duplicates, more efficient and concise
    def remove_duplicates(numbers):
        return list(set(numbers))

    # Using a loop to remove duplicates, less efficient and more complex
    def remove_duplicates_using_loop(numbers):
        unique_numbers = []
        for number in numbers:
            if number not in unique_numbers:
                unique_numbers.append(number)
        return unique_numbers
    ```



### Let's go back to our example of math reasoning


<h4 style="color: red;">Text prompt</h4>

```python
Q: Jason had 20 lollipops. He gave Denny some lollipops. 
    Now Jason has 12 lollipops. How many lollipops did Jason
    give to Denny?
    A: The answer is 8


    Q: There were nine computers in the server room. 
    Five more computers were installed each day, from monday
    to thursday. How many computers are now in the server room?</code></pre>
```

<h4>    Model completion:</h4>

<pre><code class="language-python">A: The answer is 29</code></pre>


<center><b>But who says we have to use text?</b></center>

<h4 style="color: red;">Code prompt</h4>


```python
# Q: Olivia has $23. She bought five bagels for $3 each. How much money does she have left?
# solution using Python:

def solution():
    """Olivia has $23. She bought five bagels for $3 each. How much money does she have left?"""
    money_initial = 23
    bagels = 5
    bagel_cost = 3
    money_spent = bagels * bagel_cost
    money_left = money_initial - money_spent
    result = money_left
    return result



# Q: There were nine computers in the server room. Five more computers were installed each day, from monday to thursday. How many computers are now in the server room?
# solution using Python:
```


```python
def solution():
    """There were nine computers in the server room. Five more computers were installed each day, from monday to thursday. How many computers are now in the server room?"""
    computers_initial = 9
    computers_per_day = 5
    num_days = 4  # 4 days between monday and thursday
    computers_added = computers_per_day * num_days
    computers_total = computers_initial + computers_added
    result = computers_total
    return result
```


<hr>


## TLDR

- Language models like GPT-3.5/4/ChatGPT can be thought of as compilers that interpret prompts at various levels of abstraction.

- Abstractions in programming languages evolve, with examples ranging from machine code to Python.

- Prompts can be specified using different programming styles, such as instructions or examples.

- Language models are stochastic, requiring trial and error to produce the desired output.

- Alternative forms of input, like code, can be used to achieve more precise results from the model.


## Let's get hands-on!


- We will use the [OpenAI API](https://platform.openai.com/docs/api-reference/introduction) to interact with the LLMs.

- [Colab notebook](https://github.com/madaan/memprompt/blob/main/CompletionAndChat.ipynb)


### Libraries


- [LangChain](https://python.langchain.com/en/latest/index.html)
  

- [OpenAI API](https://platform.openai.com/docs/api-reference/introduction)


- [prompt-lib](https://github.com/reasoning-machines/prompt-lib)


### More ways of prompting

- A survey of recent prompting techniques: [https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/](https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/)


### More demos

- [Your LLM has a "virtual machine"](https://github.com/reasoning-machines/prompt-lib/blob/main/notebooks/YoavsPythonPrompts.ipynb)


- [Standard interface for completion and conversation](https://github.com/madaan/memprompt/blob/main/CompletionAndChat.ipynb)


### Our recent work on LLMs

- [Self-Refine: Iteratively Enhancing Language Model Outputs through Self-Feedback](https://selfrefine.info)
- [Optimizing Programs by making Targeted Algorithmic Changes](http://pie4perf.com/)
- [Leveraging Python to Assist Language Models](http://reasonwithpal.com/)
- [What makes chain-of-thought prompting work?](https://arxiv.org/abs/2209.07686)
- [Generating Plans from LLMs as Python Programs](https://cocogen.structgen.com/)
- [Utilizing Memory to Prevent LLMs from Repeating Mistakes](https://memprompt.com)


## Acknowledgements

- The blog was originally written for the [CMU-LTI Seminar](https://www.cmu-lti-llm.org/). Thanks to the organizers for the opportunity to present the material.

- Thanks to [Adithya Pratapa](https://adithya7.github.io/) for proofeading the first draft.