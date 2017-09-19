function output = average_age_str(x)
for ii = 1:length(x)
    student_age = x(ii).age;
    agevector(ii) = student_age;
end 
output = sum(agevector)/(length(x));