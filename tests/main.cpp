#include "gtest/gtest.h"

#include "calculator.hpp"

TEST(MyTestSuite, CalculatorAddition)
{ 
    double valueA = 10.5;
    double valueB = -50.23;
    double expectedResult = -39.73;

    Calculator calc;
    ASSERT_EQ(calc.addition(valueA, valueB), expectedResult);
}

TEST(MyTestSuite, CalculatorSubtraction)
{ 
    double valueA = 10.5;
    double valueB = -50.23;
    double expectedResult = 60.73;

    Calculator calc;
    ASSERT_EQ(calc.subtraction(valueA, valueB), expectedResult);
}

TEST(MyTestSuite, CalculatorSquareRoot)
{ 
    double valueA = 9;
    double expectedResult = 3;

    Calculator calc;
    ASSERT_EQ(calc.squareRoot(valueA), expectedResult);
}

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);

    return RUN_ALL_TESTS();
}