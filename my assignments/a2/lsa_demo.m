
%{
D1: Infants and Toddler First Aid
D2: Babies & Children's Room (for your home)
D3: Child Safety at Home
D4: Your Baby's Health and Safety: From Infant to Toddler
D5: Baby Proofing Basics
D6: Your Guide to Easy Rust Proofing
D7: Beanie Babies Collectors Guide


T1: Baby (babies, baby's)
T2: Child (children)
T3: Guide
T4: Health
T5: Home
T6: Infant
T7: Proofing
T8: Safety
T9: Toddler
%}

A = [0 0 0 0 0 1 0 0 1;
     1 1 0 0 1 0 0 0 0;
     0 1 0 0 1 0 0 1 0;
     1 0 0 1 0 1 0 1 1;
     1 0 0 0 0 0 1 0 0;
     0 0 1 0 0 0 1 0 0;
     1 0 1 0 0 0 0 0 0]';
 
 
for n = 1:size(A,2)
    A(:,n) = A(:,n) / norm(A(:,n));
end
 
[U S V] = svd(A,0);

k = 2;

Sk = S(1:k,1:k);
Uk = U(:,1:k);
Vk = V(:,1:k);

Ak = Uk * Sk * Vk';

% child home safety
q = [0 1 0 0 1 0 0 1 0]';
qhat1 = -Uk' * q
disp('child home safety')
disp(num2str(qhat1));

% baby
t = [0 1 0 1 1 0 1]';
qhat2 = -Sk * Vk' * t;
disp('baby')
disp(num2str(qhat2))

% infant
t = [1 0 0 1 0 0 0]';
qhat2 = -Sk \ Vk' * t;
%qhat2 = Vk' * t;
disp('infant')
disp(num2str(qhat2))

docs = -Uk' * A;
plot(docs(1,:), docs(2,:), 'ro');

hold on;
plot(qhat1(1), qhat1(2), 'go');
plot(qhat2(1), qhat2(2), 'ko');
hold off;



