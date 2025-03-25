/**
 * @file Pair.h
 * @brief Template implementation for Pair class
 */

#ifndef PAIR_H
#define PAIR_H

template <typename T1, typename T2>
struct Pair
{
    T1 first;
    T2 second;

    Pair() : first(), second() {}
    Pair(const T1 &a, const T2 &b) : first(a), second(b) {}
};

template <typename T1, typename T2>
Pair<T1, T2> make_pair(T1 a, T2 b)
{
    return Pair<T1, T2>(a, b);
}

#endif
