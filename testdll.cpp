#include <mutex>
#include <iostream>

class C
{
public:
    C();
};

C::C()
{
#if defined(_DISABLE_CONSTEXPR_MUTEX_CONSTRUCTOR)
    std::cout << "_DISABLE_CONSTEXPR_MUTEX_CONSTRUCTOR is defined" << std::flush << std::endl;
#endif
    std::cout << "testdll: before mutex constructor" << std::flush << std::endl;
    std::mutex m;
    std::cout << "testdll: before mutex lock" << std::flush << std::endl;
    std::lock_guard<std::mutex> lock(m);
    std::cout << "testdll: success" << std::flush << std::endl;
}

// Static object is built when the DLL is initialized.
C c;
