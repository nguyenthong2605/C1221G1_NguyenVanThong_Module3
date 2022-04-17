package quan_ly.repository;

import java.util.List;

public interface ICrudRepository<E> {
    List<E> getList();

    void create(E e);

    void updaate(E e);

    E findById(int id);
}
