create or replace procedure AssignTankToUnit( 
  p_tID NUMBER,
  p_unID NUMBER,
  p_tankInfo OUT SYS_REFCURSOR) is
begin
    -- ����� ����� ����
  UPDATE TANK
  SET unID = p_unID
  WHERE tID = p_tID;

  --������ ���� �� ���� ������ Ref Cursor �����
  OPEN p_tankInfo FOR
    SELECT tID, unID, cID
    FROM TANK
    WHERE tID = p_tID;

  COMMIT;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Tank not found');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
end AssignTankToUnit;
/
