function z=fib(n)
if fix(n)~=n
    n=[]
    error('bledny parametr wyjsciowy')
end
z=round((((1+sqrt(5))/2)^n-((1-sqrt(5))/2)^n)/sqrt(5));
end